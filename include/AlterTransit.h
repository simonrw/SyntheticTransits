#pragma once
#ifndef ALTERTRANSIT_H

#define ALTERTRANSIT_H



#include "Lightcurve.h"


/** Function to remove a transit from a lightcurve
 
 @param[in] data Input lightcurve

 @param[in] model Model lightcurve to subtract 

 * */
Lightcurve RemoveTransit(Lightcurve &data, Lightcurve &model);

/** Function to add a transit from a lightcurve
 *
 * @param[in] data Input lightcurve
 *
 * @param[in] model Model lightcurve to add
 */

Lightcurve AddTransit(Lightcurve &data, Lightcurve &model);

/** Function to perform an addition and a subtraction
 *
 * \deprecated Function does just call RemoveTransit then AddTransit 
 * but the function requires many more parameters and is not always used
 * so both sub-functions are used 
 */
Lightcurve AlterTransit(Lightcurve &data, Lightcurve &subModel, Lightcurve &addModel, bool WASP, bool addModelFlag=true);

#endif /* end of include guard: ALTERTRANSIT_H */
