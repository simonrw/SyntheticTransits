#include "Application.h"
#include <sstream>
#include "Exceptions.h"
#include "ObjectSkipDefs.h"
#include "constants.h"
#include "WaspDateConverter.h"
#include <stdexcept>

using namespace std;
using namespace CCfits;

namespace ad = AlterDetrending;



namespace
{
    int NCHARS = 26;

    vector<string> &split(const string &s, char delim, vector<string> &elems) {
        stringstream ss(s);
        string item;
        while(getline(ss, item, delim)) {
            elems.push_back(item);
        }
        return elems;
    }


    vector<string> split(const string &s, char delim) {
        vector<string> elems;
        return split(s, delim, elems);
    }


    /** Function to change the wasp id to something unique */
    string ChangeName(const string &obj_id)
    {
        /* Split the string at the character J to get the coordinates */
        vector<string> IDParts = split(obj_id, 'J');

        /* Check that 2 parts are returned */
        if (IDParts.size() != 2)
        {
            throw runtime_error("Invalid WASP id passed");
        }

        const string &Coords = IDParts[1];


        stringstream ss;
        ss << "1SYNTH J" << Coords;

        string NewName = ss.str();

        /* Check that there are no remaining characters */
        if ((NCHARS - (int)NewName.size()) < 0)
        {
            throw runtime_error("Invalid name constructed - will not fit into column");
        }


        return NewName;
    }

    double WidthFromParams(const Lightcurve &lc)
    {
        /* Returns the width of the full transit based on some lc parameters
         *
         * \frac{P}{\pi} \asin{\sqrt{(\frac{R_P + R_S}{a})^2 - \cos^2 i}}
         */
        const double Norm = lc.period / M_PI;
        if (lc.sep == 0)
        {
            /* Something hasn't updated the separation */
            return 0;
        }

        double FirstTerm = (lc.radius + lc.rstar) / lc.sep;

        /* Square it */
        FirstTerm *= FirstTerm;

        const double InsideSqrt = FirstTerm - cos(lc.inclination);
        return Norm * asin(sqrt(InsideSqrt));

    }
}

void Application::UpdateFile(const Lightcurve &lc, const int TargetIndex)
{

    const string FluxHDUName = "FLUX";
    ExtHDU &fluxHDU = mInfile->extension(FluxHDUName);
    ExtHDU &CatalogueHDU = mInfile->extension("CATALOGUE");
    const long nFrames = fluxHDU.axis(0);
    
    /*  have to create a valarray for writing */
    valarray<double> writeArray(nFrames);
    int status = 0;
    double sum = 0;
    int count = 0;
    for (int i=0; i<nFrames; ++i) 
    {
        double FluxValue = lc.flux[i];
        writeArray[i] = FluxValue;

        if (!isnan(FluxValue))
        {
            sum += FluxValue;
            ++count;
            
        }
    }

    double MeanFlux = sum / (double)count;
    
    long firstElement = TargetIndex * nFrames + 1;
    //fluxHDU.write(firstElement, nFrames, writeArray);

    fits_movnam_hdu(this->fptr, IMAGE_HDU, const_cast<char*>(FluxHDUName.c_str()), 0, &status);
    if (status)  throw FitsioException(status);

    fits_write_img(this->fptr, TDOUBLE, firstElement, nFrames, &writeArray[0], &status);
    if (status) throw FitsioException(status);

    /*  now update the catalgogue flux_mean parameter */
    vector<double> DoubleBuffer(1);
    vector<double> IntBuffer(1);
    DoubleBuffer[0] = MeanFlux;

    CatalogueHDU.column("FLUX_MEAN").write(DoubleBuffer, TargetIndex+1);
    


    /* Set the object's identifier to the original object's identifier */
    //char ObjID[26];
    //sprintf(ObjID, "%s", lc.obj_id.c_str());
    //sprintf(ObjID, "%s", lc.obj_id.c_str());
    vector<string> IDData;

    /* Use the new name */
    try
    {
        IDData.push_back(ChangeName(lc.obj_id));
    }
    catch (runtime_error &e)
    {
        /* Probably using ngts file */
    }

    try
    {
        CatalogueHDU.column("OBJ_ID").write(IDData, TargetIndex+1);
    }
    catch (Column::WrongColumnType &e)
    {
        /*  didn't work, probably working on NGTS prototype data so ignore */
    }

    /* Now update the catalogue fake- columns */
    DoubleBuffer[0] = lc.radius;
    CatalogueHDU.column("FAKE_RP").write(DoubleBuffer, TargetIndex+1);
    DoubleBuffer[0] = lc.rstar;
    CatalogueHDU.column("FAKE_RS").write(DoubleBuffer, TargetIndex+1);
    DoubleBuffer[0] = lc.period;
    CatalogueHDU.column("FAKE_PERIOD").write(DoubleBuffer, TargetIndex+1);
    DoubleBuffer[0] = lc.sep;
    CatalogueHDU.column("FAKE_A").write(DoubleBuffer, TargetIndex+1);
    DoubleBuffer[0] = lc.inclination * degreesInRadian;
    CatalogueHDU.column("FAKE_I").write(DoubleBuffer, TargetIndex+1);
    IntBuffer[0] = jd2wd(lc.epoch);
    CatalogueHDU.column("FAKE_EPOCH").write(DoubleBuffer, TargetIndex+1);

    /* Calculate the depth */
    DoubleBuffer[0] = (lc.radius / lc.rstar) * (lc.radius / lc.rstar);
    CatalogueHDU.column("FAKE_DEPTH").write(DoubleBuffer, TargetIndex+1);



    /* Update the synthetics columns */
//    ExtHDU &SyntheticHDU = mInfile->extension("SYNTHETICS");
//    DoubleBuffer[0] = mObjectIndex;
//    SyntheticHDU.column("ORIGID").write(DoubleBuffer, TargetIndex+1);
//    DoubleBuffer[0] = lc.radius / rJup;
//    SyntheticHDU.column("RPLANET").write(DoubleBuffer, TargetIndex+1);
//    DoubleBuffer[0] = lc.rstar / rSun;
//    SyntheticHDU.column("RSTAR").write(DoubleBuffer, TargetIndex+1);
//    DoubleBuffer[0] = lc.inclination * degreesInRadian;
//    SyntheticHDU.column("INCLINATION").write(DoubleBuffer, TargetIndex+1);
//    DoubleBuffer[0] = lc.period / secondsInDay;
//    SyntheticHDU.column("PERIOD").write(DoubleBuffer, TargetIndex+1);
//    DoubleBuffer[0] = lc.epoch;
//    SyntheticHDU.column("EPOCH").write(DoubleBuffer, TargetIndex+1);

    /* need to update the skipdet column */
    Column &SkipdetCol = CatalogueHDU.column("SKIPDET");

    /*  need two cases:
     *      if it's the original lightcurve then it only needs to be ignored by tfa
     *      if it's a synthetic then it needs to be ignored by both
     *
     *  if clause detects this */
    vector<unsigned int> FillData(1);
    if (TargetIndex == mObjectIndex)
    {
        FillData[0] = ad::skiptfa;
    }
    else
    {
        FillData[0] = ad::skipboth;
    }

    SkipdetCol.write(FillData, TargetIndex+1);
}

void Application::UpdateFile(const Lightcurve &lc)
{
    UpdateFile(lc, mObjectIndex);
    
}
