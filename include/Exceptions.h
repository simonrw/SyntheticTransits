#pragma once
#ifndef EXCEPTIONS_H

#define EXCEPTIONS_H

#include <exception>
#include <string>

/** Base exception
 *
 * All other exceptions inherit this exception for easy filtering of
 * exceptions
 *
 * Extra functionality: the object takes a std::string parameter
 * for customising the error message and returns this string (as
 * a C-string) in the what() method.
 * */
struct BaseException : public std::exception
{
	std::string str;
    BaseException(const std::string &val) : str(val) {}
    ~BaseException() throw() {}
    const char *what() const throw() { return str.c_str(); }
};


/** Thrown if the selected object is not in the file */
struct ObjectNotFound : public BaseException
{
    ObjectNotFound(const std::string &val) : BaseException(val) {}
};

/** Custom xml exception if any xml handling goes wrong */
struct XMLException : public BaseException
{
	XMLException(const std::string &val) : BaseException(val) {}
};


#endif /* end of include guard: EXCEPTIONS_H */


