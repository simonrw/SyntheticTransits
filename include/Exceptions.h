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
    std::string type;
    BaseException(const std::string &val) : str(val), type("") {}
    ~BaseException() throw() {}
    const char *what() const throw() { return str.c_str(); }
};


/** Thrown if the selected object is not in the file */
struct ObjectNotFound : public BaseException
{
    ObjectNotFound(const std::string &val) : BaseException(val)
    {
        type = "Object not found";
    }
};

/** Custom xml exception if any xml handling goes wrong */
struct XMLException : public BaseException
{
	XMLException(const std::string &val) : BaseException(val)
    {
        type = "XML Error";
    }
};

/** Memory exception if the user requires less than 0 or more than all of the memory */
struct MemoryException : public BaseException
{
    MemoryException(const std::string &val) : BaseException(val)
    {
        type = "Memory error";
    }
};

struct FileNotOpen : public BaseException
{
    FileNotOpen(const std::string &val) : BaseException(val)
    {
        type = "File not open";
    }
};


#endif /* end of include guard: EXCEPTIONS_H */

