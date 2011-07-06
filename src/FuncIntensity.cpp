#include "FuncIntensity.h"
#include "FuncSquare.h"
#include <vector>
#include <cmath>

double I(double r, double c1, double c2, double c3, double c4)
{
    double rprimed = 1. - square(r);

    double I = 1.;
    I -= c1 * (1. - pow(rprimed, 1./4.));
    I -= c2 * (1. - pow(rprimed, 2./4.));
    I -= c3 * (1. - pow(rprimed, 3./4.));
    I -= c4 * (1. - pow(rprimed, 4./4.));
    return I;
}

double I(double r, const std::vector<double> &coeffs)
{
    double rprimed = 1. - square(r);


    double I = 1.;
	for (int i=1; i<=4; ++i)
	{
		double coeff = coeffs.at(i);

		I -= coeff * (1. - pow(rprimed, static_cast<double>(i)/4.));
	}


    return I;
}

double IntegratedI(double dr, double c1, double c2, double c3, double c4, double rlow, double rhigh)
{
	double sum = 0;
	for (double r=rlow; r<=rhigh; r+=dr)
	{
		sum += I(r, c1, c2, c3, c4) * dr * 2. * r;
	}
	return sum;

}


double IntegratedI(double dr, const std::vector<double> &coeffs, double rlow, double rhigh)
{
	double sum = 0;
	for (double r=rlow; r<=rhigh; r+=dr)
	{
		sum += I(r, coeffs) * dr * 2. * r;
	}
	return sum;

}
