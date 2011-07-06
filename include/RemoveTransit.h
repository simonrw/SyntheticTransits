#pragma once
#ifndef REMOVETRANSIT_H

#define REMOVETRANSIT_H

#include "Lightcurve.h"
#include <algorithm>


bool PairComparitor(const std::pair<double, int> &val1, const std::pair<double, int> &val2);

template <typename T>
std::vector<std::pair<double, int> > SortedIndex(const std::vector<T> &data)
{
	std::vector<std::pair<double, int> > returned(data.size());
    for (size_t i=0; i<data.size(); ++i)
    {
		std::pair<double, int> line;
        line.first = data[i];
        line.second = i;

        returned[i] = line;

    }

    sort(returned.begin(), returned.end(), PairComparitor);
    return returned;

}


Lightcurve RemoveTransit(Lightcurve &data, Lightcurve &model);


#endif /* end of include guard: REMOVETRANSIT_H */
