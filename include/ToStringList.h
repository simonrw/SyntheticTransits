#pragma once
#ifndef TOSTRINGLIST_H

#define TOSTRINGLIST_H

#include <vector>
#include <string>
#include <sstream>
#include <CCfits/CCfits>

template <typename T>
std::vector<std::string> ToStringList(CCfits::Column &col, int size)
{
	std::vector<T> data;
    col.read(data, 1, size);
	std::vector<std::string> output;
    for (int i=0; i<size; ++i)
    {
		std::stringstream ss;
        ss << data.at(i);
        output.push_back(ss.str());
    }

    return output;
}


#endif /* end of include guard: TOSTRINGLIST_H */
