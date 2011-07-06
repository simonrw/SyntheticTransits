#include "Application.h"

using namespace std;
using namespace CCfits;

/** Utility function to return the data from a CCfits::ExtHDU
 *
 * This code uses the mInfile auto_ptr and HDU name hduname
 * and returns the lightcurve for the object at index mObjectIndex.
 * This is then returned. */
valarray<double> Application::getHDUData(const string &hduname)
{
    valarray<double> output;
    ExtHDU &selectedHDU = mInfile->extension(hduname);
    const long nFrames = selectedHDU.axis(0);
    
    long firstElement = mObjectIndex * nFrames + 1;
    selectedHDU.read(output, firstElement, nFrames);
    return output;
}
