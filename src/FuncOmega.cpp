#include "FuncOmega.h"

double calcOmega(const std::vector<double> &coeffs)
{
	double returnval;
	for (int n=0; n<=4; ++n)
	{
		returnval += coeffs.at(n) / (n + 4.);
	}
	return returnval;
}

