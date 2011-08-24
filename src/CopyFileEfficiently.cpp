#include <iostream>
#include <CCfits/CCfits>

/*  local includes */
#include "GetSystemMemory.h"
#include "Exceptions.h"

using namespace CCfits;
using namespace std;

typedef map<string, Column*> ColumnMap;
typedef vector<string> StringVector;


/*  forward declaration */
template <typename T>
void CopyImageData(ExtHDU &InHDU, ExtHDU &OutHDU, fitsfile *infptr, fitsfile *outfptr, float MemLimit);

void CopyFileEfficiently(const string &Filename, const int nExtra, const string &OutputFilename, const float fraction)
{
    map<int, string> ImageTypes;
    ImageTypes[8] = "Unsigned integer";
    ImageTypes[16] = "Signed integer";
    ImageTypes[32] = "Long integer";
    ImageTypes[64] = "Long long integer";
    ImageTypes[-32] = "Floating point";
    ImageTypes[-64] = "Double precision";



    /*  deal with the system memory */
    long TotalSystemMemory = getTotalSystemMemory();
    cout << "System memory: " << TotalSystemMemory / 1024. / 1024. << " MB" << endl;


    float AllowedSystemMemory = fraction * TotalSystemMemory;
    cout << "Using " << AllowedSystemMemory / 1024. / 1024. << " MB (" << fraction * 100 << "%)" << endl;
    


    auto_ptr<FITS> pInfile(new FITS(Filename.c_str(), Read));

    /*  this constructor copies the primary hdu across
     *
     *  which is handy */
    auto_ptr<FITS> pOutfile(new FITS(OutputFilename.c_str(), *(pInfile.get())));

    /* Set the transinj keyword to true */
    pOutfile->pHDU().addKey("TRANSINJ", true, "Contains false transits");


    /*  need to get the dimensions of the data set */
    ExtHDU &CatalogueHDU = pInfile->extension("CATALOGUE");
    ExtHDU &ImagelistHDU = pInfile->extension("IMAGELIST");

    const long nObjects = CatalogueHDU.rows();
    const long nFrames = ImagelistHDU.rows();
    cout << nObjects << " objects found" << endl;
    cout << nFrames << " frames found" << endl;

    const long nTotal = nObjects + nExtra;

    cout << nExtra << " objects will be appended making a total of " << nTotal << " objects" << endl;

    /*  creating the Catalogue HDU */
    /*  ******************************************************************************** */
    /*  get a list of the columns in the catalogue hdu */
    const ColumnMap Columns = CatalogueHDU.column();
    StringVector ColumnNames, ColumnFormats, ColumnUnits;
    for (ColumnMap::const_iterator i=Columns.begin();
            i!=Columns.end();
            ++i)
    {
        //cout << "Found column: " << i->first << endl;
        ColumnNames.push_back(i->first);
        ColumnFormats.push_back(i->second->format());
        ColumnUnits.push_back(i->second->unit());
    }

    /* Need to add the skipdet column */
    ColumnNames.push_back("SKIPDET");
    ColumnFormats.push_back("1I");
    ColumnUnits.push_back("");

    /*  create the new hdu */
    Table *NewCatalogueHDU = pOutfile->addTable("CATALOGUE", nTotal, ColumnNames, ColumnFormats, ColumnUnits);
    
//    /* Create a new hdu for the false parameters 
//     
//     Re-use the previous variables  */
//    ColumnNames.resize(0);
//    ColumnFormats.resize(0);
//    ColumnUnits.resize(0);
//    
//    ColumnNames.push_back("ORIGID");
//    ColumnNames.push_back("RPLANET");
//    ColumnNames.push_back("RSTAR");
//    ColumnNames.push_back("INCLINATION");
//    ColumnNames.push_back("PERIOD");
//    ColumnNames.push_back("EPOCH");
//
//    ColumnFormats.push_back("1J");
//    
//    for (int i=0; i<5; ++i)
//        ColumnFormats.push_back("1D");
//    
//    ColumnUnits.push_back("");
//    ColumnUnits.push_back("RJ");
//    ColumnUnits.push_back("RSun");
//    ColumnUnits.push_back("Degrees");
//    ColumnUnits.push_back("Days");
//    ColumnUnits.push_back("JD");
//    
//    pOutfile->addTable("SYNTHETICS", nTotal, ColumnNames, ColumnFormats, ColumnUnits);
    
    



    /*  copy the data across */
    for (ColumnMap::const_iterator i=Columns.begin();
            i!=Columns.end();
            ++i)
    {
        Column &NewColumn = NewCatalogueHDU->column(i->first);

        /*  get the data type */
        string Format = i->second->format();

        if (Format == "1J")
        {
            /*  data type is long */
            vector<long> data;
            i->second->read(data, 1, nObjects);
            NewColumn.write(data, 1);

        }
        else if (Format == "1I")
        {
            /*  data type is int */
            vector<int> data;
            i->second->read(data, 1, nObjects);
            NewColumn.write(data, 1);
        }
        else if (Format == "1E")
        {
            /*  data type is float */
            vector<float> data;
            i->second->read(data, 1, nObjects);
            NewColumn.write(data, 1);
        }
        else if (Format == "26A")
        {
            /*  data type is string */
            vector<string> data;
            i->second->read(data, 1, nObjects);
            NewColumn.write(data, 1);
        }
        else if (Format == "1D")
        {
            /*  data type is double */
            vector<double> data;
            i->second->read(data, 1, nObjects);
            NewColumn.write(data, 1);
        }
        else
        {
            cerr << "Unknown data type: " << Format << endl;
        }
    }

















    /* Creating the imagelist hdu */
    /*  ******************************************************************************** */
    /*  can just copy the hdu directly across */
    pOutfile->copy(ImagelistHDU);

    /*  now copy the image hdus one by one */
    StringVector ImageHDUNames;
    ImageHDUNames.push_back("HJD");
    ImageHDUNames.push_back("FLUX");
    ImageHDUNames.push_back("FLUXERR");
    ImageHDUNames.push_back("CCDX");
    ImageHDUNames.push_back("CCDY");
    ImageHDUNames.push_back("QUALITY");
    ImageHDUNames.push_back("SKYBKG");

    vector<long> naxes(2);
    naxes[0] = nFrames;
    naxes[1] = nTotal;


    for (StringVector::const_iterator i=ImageHDUNames.begin();
            i!=ImageHDUNames.end();
            ++i)
    {
        /*  get the bitpix of the original hdu */
        cout << "Creating the " << *i << " HDU" << endl;
        const long bitpix = pInfile->extension(*i).bitpix();
        cout << "HDU Format: " << ImageTypes[bitpix] << endl;


        /*  add the hdu */
        ExtHDU *NewHDU = pOutfile->addImage(*i, bitpix, naxes);
        ExtHDU &OldHDU = pInfile->extension(*i);
        fitsfile *infptr = pInfile->fitsPointer();
        fitsfile *outfptr = pOutfile->fitsPointer();

        /*  copy the data across one line at a time */
        switch (bitpix)
        {
            case BYTE_IMG:
                CopyImageData<unsigned int>(OldHDU, *NewHDU, infptr, outfptr, AllowedSystemMemory);
                break;
            case SHORT_IMG:
                CopyImageData<int>(OldHDU, *NewHDU, infptr, outfptr, AllowedSystemMemory);
                break;
            case LONG_IMG:
                CopyImageData<long>(OldHDU, *NewHDU, infptr, outfptr, AllowedSystemMemory);
                break;
            case LONGLONG_IMG:
                CopyImageData<long long>(OldHDU, *NewHDU, infptr, outfptr, AllowedSystemMemory);
                break;
            case FLOAT_IMG:
                CopyImageData<float>(OldHDU, *NewHDU, infptr, outfptr, AllowedSystemMemory);
                break;
            case DOUBLE_IMG:
                CopyImageData<double>(OldHDU, *NewHDU, infptr, outfptr, AllowedSystemMemory);
                break;
            default:
                cerr << "Unknown HDU type encountered: " << bitpix << endl;
        }

    }




}

template <typename T>
void CopyImageData(ExtHDU &InHDU, ExtHDU &OutHDU, fitsfile *infptr, fitsfile *outfptr, float MemLimit)
{
    /*  just copy the existing data across */
    const long nFrames = InHDU.axis(0);
    const long nObjects = InHDU.axis(1);
    const long N = nObjects * nFrames;
    int status = 0;

    const long nElementsInMemory = long(MemLimit / sizeof(T));
    cout << "Elements are " << sizeof(T) << " bytes" << endl;
    const long nIterationsRequired = (N / nElementsInMemory) + 1;
    cout << "Can load " << nElementsInMemory << " elements into memory" << endl;
    cout << "Going to take " << nIterationsRequired << " iterations" << endl;

    FITSUtil::MatchType<T> DataType;
    //cout << "Fitsio data type: " << DataType() << endl;



    //valarray<T> buffer(nElementsInMemory);
    vector<T> buffer(nElementsInMemory);
    for (int iter=0; iter<nIterationsRequired; ++iter)
    {
        long FirstElement = 1 + iter * nElementsInMemory;

        if (iter != nIterationsRequired - 1)
        {
            cout << "Iteration " << iter + 1 << ", reading from element " << FirstElement << " to " << FirstElement + nElementsInMemory << endl;

            //InHDU.read(buffer, FirstElement, nElementsInMemory);
            fits_read_img(infptr, DataType(), FirstElement, nElementsInMemory, 0, &buffer[0], 0, &status);
            if (status) { throw FitsioException(status); }

            fits_write_img(outfptr, DataType(), FirstElement, nElementsInMemory, &buffer[0], &status);
            if (status) { throw FitsioException(status); }
        }
        else
        {
            const long nElementsLeft = N - iter * nElementsInMemory;

            /*  resize the buffer */
            buffer.resize(nElementsLeft);

            cout << "Iteration " << iter + 1 << ", reading from element " << FirstElement << " to " << FirstElement + nElementsLeft << endl;

            fits_read_img(infptr, DataType(), FirstElement, nElementsLeft, 0, &buffer[0], 0, &status);
            if (status) { throw FitsioException(status); }

            //InHDU.read(buffer, FirstElement, nElementsLeft);
            fits_write_img(outfptr, DataType(), FirstElement, nElementsLeft, &buffer[0], &status);
            if (status) { throw FitsioException(status); }
        }
    }


}
