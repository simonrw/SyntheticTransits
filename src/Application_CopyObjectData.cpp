#include "Application.h"
#include "Exceptions.h"

#include <CCfits/CCfits>

using namespace std;
using namespace CCfits;

typedef map<string, Column*> ColumnList;

/** Copies an object at given index to another location in the file
 *
 * @param LocationIndex Empty lightcurve location in the file */
void Application::CopyObject(const int LocationIndex)
{
    /*  things to retrieve:
     *      - Catalogue entries
     *      - Image data in a strip
     */
    ExtHDU &CatalogueHDU = mInfile->extension("CATALOGUE");
    ColumnList Columns = CatalogueHDU.column();

    for (ColumnList::const_iterator i=Columns.begin();
            i!=Columns.end();
            ++i)
    {

        /*  get the data type */
        string Format = i->second->format();

        if (Format == "1J")
        {
            /*  data type is long */
            vector<long> data;
            i->second->read(data, mObjectIndex + 1, mObjectIndex + 1);
            i->second->write(data, LocationIndex + 1);

        }
        else if (Format == "1I")
        {
            /*  data type is int */
            vector<int> data;
            i->second->read(data, mObjectIndex + 1, mObjectIndex + 1);
            i->second->write(data, LocationIndex + 1);

        }
        else if (Format == "1E")
        {
            /*  data type is float */
            vector<float> data;
            i->second->read(data, mObjectIndex + 1, mObjectIndex + 1);
            i->second->write(data, LocationIndex + 1);

        }
        else if (Format == "26A")
        {
            /*  data type is string */
            vector<string> data;
            i->second->read(data, mObjectIndex + 1, mObjectIndex + 1);
            i->second->write(data, LocationIndex + 1);

        }
        else if (Format == "1D")
        {
            /*  data type is double */
            vector<double> data;
            i->second->read(data, mObjectIndex + 1, mObjectIndex + 1);
            i->second->write(data, LocationIndex + 1);

        }
        else
        {
            cerr << "Unknown data type: " << Format << endl;
        }
    }

}
