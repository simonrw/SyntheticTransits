#pragma once
#ifndef ISNAN_H

#define ISNAN_H

/** Function which returns true if the argument is nan */
template <typename T>
inline bool isnan(T val) { return val == val; }


#endif /* end of include guard: ISNAN_H */
