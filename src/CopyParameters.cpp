#include "CopyParameters.h"

void CopyParameters(const Lightcurve &source, Lightcurve &dest)
{
    dest.period = source.period;
    dest.epoch = source.epoch;
    dest.radius = source.radius;
    dest.rstar = source.rstar;
    dest.inclination = source.inclination;
}