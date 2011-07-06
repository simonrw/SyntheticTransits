#include "Application.h"

using namespace std;
using namespace CCfits;

/** Update the open file with the new Lightcurve object
 *
 * First the flux must be obtained from the lightcurve object, 
 * and then written in place of the old data for the selected 
 * object
 *
 */
void Application::UpdateFile(const Lightcurve &lc)
{
    ExtHDU &fluxHDU = mInfile->extension("FLUX");
    const long nFrames = fluxHDU.axis(0);
    
    /*  have to create a valarray for writing */
    valarray<double> writeArray(nFrames);
    for (int i=0; i<nFrames; ++i) writeArray[i] = lc.flux[i];
    
    long firstElement = mObjectIndex * nFrames + 1;
    fluxHDU.write(firstElement, nFrames, writeArray);

    
}
