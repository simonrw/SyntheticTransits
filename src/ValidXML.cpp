#include "ValidXML.h"
#include <fstream>

using namespace std;

/** Function will check if a file is a valid xml file
 *
 * It does this by checking if there's an info node in the file */
bool ValidXML(const string &filename)
{
    string line;
    ifstream infile(filename.c_str());

    while (getline(infile, line))
    {
        if (line == "<info>")
            return true;
    }

    return false;
}
