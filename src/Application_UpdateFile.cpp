#include "Application.h"
#include "Exceptions.h"

using namespace std;
using namespace CCfits;




/** Update the open file at a particular location */
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
    vector<double> FluxMeanData(1);
    FluxMeanData[0] = MeanFlux;

    CatalogueHDU.column("FLUX_MEAN").write(FluxMeanData, TargetIndex+1);

    /*  set the object name to be its radius plus it's original identifier */
    char ObjID[26];
    sprintf(ObjID, "R=%.3lf", lc.radius);
    vector<string> IDData(1, ObjID);
    CatalogueHDU.column("OBJ_ID").write(IDData, TargetIndex+1);

    
}

/** Update the open file with the new Lightcurve object
 *
 * First the flux must be obtained from the lightcurve object, 
 * and then written in place of the old data for the selected 
 * object
 *
 */
void Application::UpdateFile(const Lightcurve &lc)
{
    UpdateFile(lc, mObjectIndex);
    
}
