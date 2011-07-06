#include "FuncGeometricTransit.h"
#include "FuncSquare.h"
#include <cmath>
#include <iostream>
#include <cstdlib>


/* main transit function F */
double GeometricTransit(double p, double z)
{
    double data = 0;

    if ((1 + p) < z)
    {
        data = 1. - 0.;
    }
    else if ((fabs(1. - p) < z) && (z <= 1 + p))
    {
        double k1 = acos((1 - square(p) + square(z)) / 2. / z);
        double k0 = acos((square(p) + square(z) - 1) / 2. / p / z);
        double sqRootArg = (4. * square(z) - square(1. + square(z) - square(p))) / 4.;
        data = 1. - (square(p) * k0 + k1 - sqrt(sqRootArg)) / M_PI;
    }
    else if (z <= 1 - p)
    {
        data = 1. - square(p);
    }
    else if (z <= p - 1)
    {
        data = 1. - 1.;
    }
    else 
    {
		std::cerr << "Unknown value encountered" << std::endl;
    }

    return data;
}
