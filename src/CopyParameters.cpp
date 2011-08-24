#include "CopyParameters.h"

void CopyParameters(const Lightcurve &source, Lightcurve &dest)
{
    dest.period = source.period;
    dest.epoch = source.epoch;
    dest.radius = source.radius;
    dest.rstar = source.rstar;
    dest.inclination = source.inclination;
    dest.sep = source.sep;
}

void CopyParameters(Lightcurve &dest, const double period, const double epoch, const double radius, 
const double rstar, const double inclination, const double sep)
{
    dest.period = period;
    dest.epoch = epoch;
    dest.radius = radius;
    dest.rstar = rstar;
    dest.inclination = inclination;
    dest.sep = sep;
    

    
}
