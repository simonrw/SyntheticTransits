#include "Application.h"
#include <sstream>
#include <CCfits/CCfits>

using namespace std;


Lightcurve Application::getObject()
{

    valarray<double> flux = getHDUData("FLUX");
    valarray<double> fluxerr = getHDUData("FLUXERR");
    valarray<double> hjd = getHDUData("HJD");
    
    Lightcurve returnval(flux.size());
    for (size_t i=0; i<flux.size(); ++i)
    {
        returnval.flux[i] = flux[i];
        returnval.jd[i] = hjd[i];
        returnval.fluxerr[i] = fluxerr[i];
    }

    /* Get the object id */
    CCfits::Column &ObjIDCol = mInfile->extension("CATALOGUE").column("OBJ_ID");
    int ColumnType = ObjIDCol.type();
    if (ColumnType == CCfits::Tlong)
    {
        vector<long> Names;
        ObjIDCol.read(Names, mObjectIndex+1, mObjectIndex+1);
        stringstream ss;
        ss << Names[0];
        returnval.obj_id = ss.str();
    }
    else if (ColumnType == CCfits::Tstring)
    {
        vector<string> Names;
        ObjIDCol.read(Names, mObjectIndex+1, mObjectIndex+1);
        returnval.obj_id = Names[0];
    }

    
    return returnval;

    
}

