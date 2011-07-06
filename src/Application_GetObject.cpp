#include "Application.h"

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
    
    return returnval;

    
}

