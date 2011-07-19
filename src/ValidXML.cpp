#include "ValidXML.h"
#include <pugixml.hpp>

using namespace std;

bool ValidXML(const string &filename)
{
    pugi::xml_document doc;
    pugi::xml_parse_result result = doc.load_file(filename.c_str());

    if (result)
    {
        /*  file is valid */
        return true;
    }
    else
    {
        /*  file is not valid */
        return false;
    }
}
