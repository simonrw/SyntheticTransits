#ifndef COPYPARAMETERS_H_
#define COPYPARAMETERS_H_

#include "Lightcurve.h"

void CopyParameters(const Lightcurve &source, Lightcurve &dest);
void CopyParameters(Lightcurve &dest, const double period, const double epoch, const double radius, 
                    const double rstar, const double inclination);


#endif