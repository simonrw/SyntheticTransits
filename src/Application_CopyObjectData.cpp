#include "Application.h"
#include "Exceptions.h"

#include <CCfits/CCfits>

using namespace std;
using namespace CCfits;

/** Copies an object at given index to another location in the file
 *
 * @param pFile File auto_ptr which contains the original data and space for new data
 * @param TargetIndex Source object index from where to take the data
 * @param LocationIndex Empty lightcurve location in the file */
void Application::CopyObject(auto_ptr<FITS> &pFile, const int TargetIndex, const int LocationIndex)
{
}
