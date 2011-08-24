#ifndef WASPDATECONVERTER_H

#define WASPDATECONVERTER_H

#include "constants.h"

namespace
{
    const double jd_ref = 2453005.5;
}

template <typename T>
inline double wd2jd(T wd)
{
    double jd = (wd / secondsInDay) + jd_ref;
    return jd;
}

template <typename T>
inline double jd2wd(T jd)
{
    double wd = (jd - jd_ref) * secondsInDay;
    return wd;
}



#endif /* end of include guard: WASPDATECONVERTER_H */
