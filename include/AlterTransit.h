#pragma once
#ifndef ALTERTRANSIT_H

#define ALTERTRANSIT_H



#include "Lightcurve.h"


Lightcurve RemoveTransit(Lightcurve &data, Lightcurve &model);
Lightcurve AddTransit(Lightcurve &data, Lightcurve &model);
Lightcurve AlterTransit(Lightcurve &data, Lightcurve &subModel, Lightcurve &addModel);

#endif /* end of include guard: ALTERTRANSIT_H */
