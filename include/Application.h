#pragma once
#ifndef APPLICATION_H

#define APPLICATION_H


#include <memory>
#include <CCfits/CCfits>
#include "Lightcurve.h"

/** \mainpage
 *
 * \section Introduction
 *
 * This software takes a Sysrem-compatible data file and alters
 * the chosen lightcurve by removing an already present transit
 * and adding a custom synthetic transit in.
 *
 *
 * \section Motivation
 *
 * WASP-12b is an extremely large exoplanet, almost larger than thought possible.
 * Due to it's large size, it is fairly visible as the transit depth depends
 * on the ratio of stellar and planetary radii
 *
 * \f[
 * 	\delta = \frac{r_p^2}{r_s^2}
 * \f]
 *
 * What if WASP-12b was slightly smaller? Perhaps this would not have been detected by SuperWASP.
 * By generating synthetic WASP-12b lightcurves with differing radii the sensitivity to the planetary
 * radius can be mapped out. If other parameters are considered also then this could lead to an
 * understanding of the selection biases towards certain kinds of planet in the SuperWASP survey
 * and a possible understanding of the underlying population.
 *
 * \section Method
 *
 * First the data file is opened and scanned for the given object. If no object with the specified
 * name is found then an exception is thrown. The lightcurve is then read in to memory.
 *
 * Two synthetic lightcurves are generated with the parameters given on the command line using the
 * Mandel & Agol model with non-linear limb darkening.
 *
 * Firstly the subtracted model is phase folded on the period and epoch values supplied, and a
 * linear interpolator object is generated with this data. A model lightcurve is then interpolated on
 * to the data's time grid, the data normalised to its own mean and the interpolated model is subtracted.
 *
 * Then the model lightcurve is added in a similar process. 
 *
 *
 * \section dependencies Software dependencies
 *
 * All the code is written in C++ so a working compiler must be available.
 *
 * For compilation on another system, certain libraries must also be installed. These include:
 * 	\li CMake (for the build system)
 * 	\li CCfits
 * 	\li pugixml
 * 	\li tclap
 * 	\li Numerical recipes 3
 *
 * \section notes Notes for the creator
 *
 *
 * \todo Package all external requirements in another directory
 *
 */

/** Main class for the program
 *
 * The class that handles the file io and storing the data
 * in a useful way.
 */


class Application
{
    public:
	/** Default constructor
	 *
	 * Garuntees the object index and number of object
	 * initialisation */
    Application() : mObjectIndex(-1), mNObjects(0) {};


    int go(int argc, char *argv[]);

    private:

    Lightcurve GenerateModel(const std::string &xmlfilename);
    int ObjectIndex(const std::string &objName);
	std::valarray<double> getHDUData(const std::string &hduname);
    Lightcurve getObject();


    /** Update a lightcurve at a particular location
     
     General function where TargetIndex is the location to write to
     NOTE: Fits libraries are 1-indexed
     
     \param lc Input lightcurve


     \param TargetIndex Location to write the flux data to */
    void UpdateFile(const Lightcurve &lc, const int TargetIndex);

    /** Overloaded function
     *
     * Replaces the lightcurve at the source location */
    void UpdateFile(const Lightcurve &lc);

    void CopyObject(const int LocationIndex);


	/** CCfits::FITS object auto_ptr for RAII */
	std::auto_ptr<CCfits::FITS> mInfile;

    /** fits pointer for when it's needed */
    fitsfile *fptr;

	/** Selected object index */
    int mObjectIndex;

	/** Number of total objects in the data set */
    long mNObjects;
};


#endif /* end of include guard: APPLICATION_H */
