#pragma once
#ifndef SORTEDINDEX_H

#define SORTEDINDEX_H


#include <algorithm>

#define _USESTDVECTOR_
#include <nr/nr3.h>
#include <nr/interp_1d.h>
#include <nr/interp_linear.h>



bool PairComparitor(const pair<double, int> &val1, const pair<double, int> &val2)
{
    return (val1.first < val2.first);
}

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

#endif /* end of include guard: SORTEDINDEX_H */

