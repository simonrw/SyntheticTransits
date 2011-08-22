#pragma once

#ifndef _H_LIGHTCURVE_H_
#define _H_LIGHTCURVE_H_

#include <vector>
#include <string>


/** Lightcurve class which stores information about a single object
 *
 */

class Lightcurve
{
    /** Number of data points in the lightcurve */
    size_t npts;

public:

    /** Original wasp id */
    std::string obj_id;


	/**	Orbital period (days)*/
    double period;

    /** Treat the object as a WASP object 
     Basically means the jd is actually wd */
    bool asWASP;

    /** Radius (Jupiter radii) */
    double radius;
    
    /** Stellar radius (Solar radii) */
    double rstar;
    
    /** Orbital separation (AU) */
    double sep;
    
    /** Inclination (degreees) */
    double inclination;


	/**	Point of mid transit (days) */
    double epoch;

	/** Time series for the time, flux and errors */
    std::vector<double> jd, flux, fluxerr;

	/** Constructor
	 *
	 * Sets the size of the input vectors to be of size n*/
    Lightcurve(size_t n);

	/** Manually clears the timeseries vectors */
    void clear();

	/** Returns the number of data points in the lightcurve */
    size_t size() const;

	/** Returns a vector of the phase information
	 *
	 * Calculates the number of periods since the epoch, then takes
	 * the decimal part and creates the 0 point to be at the
	 * point of mid transit.
	 *
	 * This phase information is not stored in the class itself. */
    std::vector<double> phase();
    
    /** Assignment constructor */
    Lightcurve &operator=(const Lightcurve &obj);
};


#endif
