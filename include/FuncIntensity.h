#pragma once
#include <vector>

double I(double r, double c1, double c2, double c3, double c4);
double I(double r, const std::vector<double> &coeffs);
double IntegratedI(double dr, double c1, double c2, double c3, double c4, double rlow, double rhigh);
double IntegratedI(double dr, const std::vector<double> &coeffs, double rlow, double rhigh);
