#ifndef WASPDATECONVERTER_H

#define WASPDATECONVERTER_H

#include "constants.h"

template <typename T>
inline double wd2jd(T wd)
{
    double jd_ref = 2453005.5;
    double jd = (wd / secondsInDay) + jd_ref;
    return jd;
}

template <typename T>
inline double jd2wd(T jd)
{
    double jd_ref = 2453005.5;
    double wd = (jd - jd_ref) * secondsInDay;
    return wd;
}



#endif /* end of include guard: WASPDATECONVERTER_H */
