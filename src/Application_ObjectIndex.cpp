#include "Application.h"
#include "ToStringList.h"
#include "Exceptions.h"

using namespace std;
using namespace CCfits;

/** Returns the object index
 *
 * The OBJ_ID column data type differs for NGTS and WASP
 * so there needs to be a function that deals with this.
 *
 * If the column type is TSTRING then the data is just read
 * to a std::vector<string>. Otherwise if it is numerical (int, long etc.) 
 * then it's converted first. 
 *
 * If the object is not found then an ObjectNotFound exception is thrown */
int Application::ObjectIndex(const string &objName)
{
    /*  retrieves the object from the file 
     
     Throws exception if it cannot be found */
    ExtHDU &catalogue = mInfile->extension("CATALOGUE");   
    Column &objectIndexColumn = catalogue.column("OBJ_ID");
    
    mNObjects = catalogue.rows();
    
    int ColumnType = objectIndexColumn.type();
    vector<string> ObjectIds;
    
    if (ColumnType == Tstring)
    {
        objectIndexColumn.read(ObjectIds, 1, mNObjects);
    }
    else if (ColumnType == Tint)
    {
        ObjectIds = ToStringList<int>(objectIndexColumn, mNObjects);
    }
    else if (ColumnType == Tlong)
    {
        ObjectIds = ToStringList<long>(objectIndexColumn, mNObjects);
    }

    else if (ColumnType == Tdouble)
    {
        ObjectIds = ToStringList<double>(objectIndexColumn, mNObjects);
    }
    
    for (int i=0; i<mNObjects; ++i)
    {
        if (ObjectIds.at(i) == objName)
        {
            cout << "Object " << objName << " found at index " << i << endl;
            return i;
        }
            
    }
    
        
    /*  if function reaches here then the object has not been found */
    throw ObjectNotFound("Cannot find the object specified");
    
}
