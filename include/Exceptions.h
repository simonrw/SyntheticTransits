#pragma once
#ifndef EXCEPTIONS_H

#define EXCEPTIONS_H

#include <exception>
#include <string>

#include <fitsio.h>

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
    /** Message to be printed
     *
     * When the exception catcher prints the error message using
     * the BaseException::what() method, this variable is returned */
	std::string str;

    /** Type string
     *
     * Allows the catch code to print which type the
     * exception is. */
    std::string type;

    /** Constructor
     *
     * Sets the error message to be set */
    BaseException(const std::string &val) : str(val), type("") {}
    virtual ~BaseException() throw() {}

    /** Returns the BaseException::str variable */
    const char *what() const throw() { return str.c_str(); }
};

/** cfitsio specific exception
 *
 * Takes a cfitsio status integer and the FitsioException::what() function 
 * returns the cfitiso error message
 *
 * @param[in] status cfitsio status number
 */
class FitsioException : public BaseException
{
    public:
        FitsioException(const int status) : BaseException(""), status(status) {}
        virtual ~FitsioException() throw() {}
        const char *what() const throw()
        {
            fits_get_errstatus(status, (char*)errmsg);
            return errmsg;
        }

        int GetStatus() const { return this->status; }


    private:
        int status;
        char errmsg[FLEN_STATUS];
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

/** Exception for a bad filename given */
struct FileNotOpen : public BaseException
{
    FileNotOpen(const std::string &val) : BaseException(val)
    {
        type = "File not open";
    }
};


#endif /* end of include guard: EXCEPTIONS_H */


