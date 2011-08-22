#include "Application.h"
#include <sstream>
#include "Exceptions.h"
#include "ObjectSkipDefs.h"
#include "constants.h"

using namespace std;
using namespace CCfits;

namespace ad = AlterDetrending;



void Application::UpdateFile(const Lightcurve &lc, const int TargetIndex)
{

    const string FluxHDUName = "FLUX";
    ExtHDU &fluxHDU = mInfile->extension(FluxHDUName);
    ExtHDU &CatalogueHDU = mInfile->extension("CATALOGUE");
    ExtHDU &SyntheticHDU = mInfile->extension("SYNTHETICS");
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
    vector<double> ColumnBuffer(1);
    ColumnBuffer[0] = MeanFlux;

    CatalogueHDU.column("FLUX_MEAN").write(ColumnBuffer, TargetIndex+1);
    
    /* Update the synthetics columns */
    ColumnBuffer[0] = lc.radius / rJup;
    SyntheticHDU.column("RPLANET").write(ColumnBuffer, TargetIndex+1);
    ColumnBuffer[0] = lc.rstar / rSun;
    SyntheticHDU.column("RSTAR").write(ColumnBuffer, TargetIndex+1);
    ColumnBuffer[0] = lc.inclination;
    SyntheticHDU.column("INCLINATION").write(ColumnBuffer, TargetIndex+1);
    ColumnBuffer[0] = lc.period / secondsInDay;
    SyntheticHDU.column("PERIOD").write(ColumnBuffer, TargetIndex+1);
    ColumnBuffer[0] = lc.epoch;
    SyntheticHDU.column("EPOCH").write(ColumnBuffer, TargetIndex+1);


    /*  set the object name to be its radius plus it's original identifier */
    //char ObjID[26];
    //sprintf(ObjID, "R=%.3lf", lc.radius);
    vector<string> IDData;
    IDData.push_back(lc.obj_id);

    try
    {
        CatalogueHDU.column("OBJ_ID").write(IDData, TargetIndex+1);
    }
    catch (Column::WrongColumnType &e)
    {
        /*  didn't work, probably working on NGTS prototype data so ignore */
    }

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
