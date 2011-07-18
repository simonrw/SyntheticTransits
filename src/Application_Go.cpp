#include <iostream>
#include <cmath>
#include <CCfits/CCfits>
#include <vector>
#include <tclap/CmdLine.h>
#include <sstream>
#include <fstream>
//#include <glog/logging.h>

/*  boost includes */
#include <boost/filesystem.hpp>


/* nr includes 
 *
 * must come after everything else as it redefines
 * the exception class
 * */

/* local includes */
#include "Lightcurve.h"
#include "Application.h"
#include "Exceptions.h"
#include "AlterTransit.h"
#include "GetSystemMemory.h"
#include "CopyFileEfficiently.h"



using namespace std;
using namespace CCfits;
namespace bf = boost::filesystem;





typedef list<string> StringList;






/* steps
 *
 * Read in the xml file and generate a model lightcurve
 *
 * Open data file
 * - if new file is selected then directly copy the file to a
 *   new location
 *
 * Select the object in the file
 *
 * Subtract the subtracting model
 *
 * (optionally) Add the adding model 
 *
 * Close the file */






/** Function to get the number of objects in a fits file
 *
 * Static funciton as it's only required in the Application::go() method */
int getNObjects(const string &filename)
{
    int nObjects = -1;
    /*  assume the number of objects is just the number of entries in the
     *  catalogue hdu */
    auto_ptr<FITS> pInfile(new FITS(filename, Read));

    ExtHDU &CatalogueHDU = pInfile->extension("CATALOGUE");
    nObjects = CatalogueHDU.rows();

    return nObjects;
}



/**	The main function, abstracted from the main function for good separation
 *
 * Runs all of the later code and garruntees RAII behaviour */
int Application::go(int argc, char *argv[])
{
    /* new main function */
    TCLAP::CmdLine cmd("Synthetic lightcurves");
    TCLAP::ValueArg<float> memlimit_arg("M", "memorylimit", "Fraction of system memory to use", false, 0.1, "0-1", cmd);
    TCLAP::SwitchArg wasptreatment_arg("w", "wasp", "Do not treat as WASP object", cmd, true);
    TCLAP::ValueArg<string> output_arg("o", "output", "Optional output file", false, "output.fits", "Fits filename", cmd);
    TCLAP::ValueArg<string> objectid_arg("O", "object", "Object to alter", true, "", "Object identifier", cmd);
    TCLAP::ValueArg<string> subModel_arg("s", "submodel", "Model to subtract", true, "", "Model xml file", cmd);
    //TCLAP::ValueArg<string> addModel_arg("a", "addmodel", "Model to add", true, "", "Model xml file", cmd);
    TCLAP::ValueArg<string> addModelFilename_arg("a", "addmodels", "List of model files", true, "", "List of files", cmd);
    TCLAP::UnlabeledValueArg<string> filename_arg("file", "File", true, "", "Fits file", cmd);



    cmd.parse(argc, argv);

    /*  get the system memory */
    long SystemMemory = getTotalSystemMemory();

    cout  << "System memory: " << SystemMemory / 1024. / 1024. << " MB" << endl;
    float MemFraction = memlimit_arg.getValue();

    /*  make sure this is within the range 0-1 */
    if ((MemFraction <= 0) || (MemFraction > 1))
    {
        throw MemoryException("Allowed memory is within range 0-1");
    }

    //float AvailableMemory = MemFraction * SystemMemory;
    //cout << "Using " << AvailableMemory / 1024. / 1024. << " MB of memory" << endl;

    /*  need to deal with whether the addmodel argument is null or not */
    /*  if the model argument is NULL then do not add a model into the lightcurve */
    bool addModelFlag = true;
    if (addModelFilename_arg.getValue() == "NULL")
    {
        /*  Not adding a model into the lightcurve */
        addModelFlag = false;
        cout << "Not adding a transit" << endl;
    }

    /*  need to get the list of extra models to add */
    int nExtra = 0;

    /*  need a subtraction model whatever happens */
    Lightcurve SubModel = GenerateModel(subModel_arg.getValue());

    StringList AddModelFilenames;

    /*  need to get the path of the models list file */
    bf::path BasePath = bf::path(addModelFilename_arg.getValue()).parent_path();
    cout << "Using base path: " << BasePath << endl;


    if (addModelFlag)
    {
        ifstream ModelsListFile(addModelFilename_arg.getValue().c_str());
        if (!ModelsListFile.is_open())
        {
            throw FileNotOpen("Cannot open list of model files for reading");
        }

        string line;
        while (getline(ModelsListFile, line))
        {
            bf::path FullPath = BasePath / bf::path(line);


            AddModelFilenames.push_back(FullPath.string());
            nExtra++;
        }


        cout << nExtra << " lightcurves will be appended to the file" << endl;


    }
    else
    {
        /*  deal with this later */
    }




    /*  print if the object is from wasp or not */
    if (wasptreatment_arg.getValue())
        cout << "WASP object chosen" << endl;
    else
        cout << "Non-WASP object chosen" << endl;

    /*  need to get the number of objects that were originally in the 
     *  file so we know which index to add the nExtra objects at */
    const int nObjects = getNObjects(filename_arg.getValue());
    const int nObjectsTotal = nObjects + nExtra;


    /*  now copy the file across */
    /*  exclamation mark ensures the file is overwritten if it exists */
    CopyFileEfficiently(filename_arg.getValue(), nExtra, "!" + output_arg.getValue(), MemFraction);
    string DataFilename = output_arg.getValue();

    /*  open the fits file */
    mInfile = auto_ptr<FITS>(new FITS(DataFilename, Write));
    
    /*  get the desired index */
    mObjectIndex = ObjectIndex(objectid_arg.getValue());
    
    /*  extract the flux */
    Lightcurve ChosenObject = getObject();
    
    /*  update the period and epoch */
    ChosenObject.period = SubModel.period;
    ChosenObject.epoch = SubModel.epoch;

    /*  now need to iterate through the list of filenames generating 
     *  a new object every time 
     *
     *  TODO: This will generate a lot of output if the code remains as it is 
     *  so this may need altering */

    int count = 0;
    for (StringList::iterator i=AddModelFilenames.begin();
            i!=AddModelFilenames.end();
            ++i, ++count)
    {

    }














    return 0;





    



    

    
    
    //[>  start by copying the file across to the output file <]
    //stringstream copycmd;
    //copycmd << "cp " << filename_arg.getValue() << " " << output_arg.getValue();

    //system(copycmd.str().c_str());
    
    //[>  alter the filename to have a ! in front of it <]
    
    
    
    //[>  create the interpolated values <]
    ////Lightcurve TransitRemovedLC = RemoveTransit(ChosenObject, SubModel);
    

    ////[>  now add the transit back in <]
    ////Lightcurve TransitAddedLC = AddTransit(TransitRemovedLC, AddModel);

    //Lightcurve NewLightcurve = AlterTransit(ChosenObject, SubModel, AddModel, wasptreatment_arg.getValue(), addModelFlag);

    //[>  finally update the file <]
    //UpdateFile(NewLightcurve);



    return 0;
}


int main(int argc, char *argv[])
{
    try
    {
        Application app;
        return app.go(argc, argv);
    }
    catch (FitsException &e)
    {
        cerr << "FITS Exception: " << e.message() << endl;
    }
    catch (FitsioException &e)
    {
        cerr << "FITSIO Exception: " << e.what() << endl;
    }
    catch (TCLAP::ArgException &e)
    {
        cerr << "TCLAP error: " << e.error() << " for arg " << e.argId() << endl;
    }
    catch (BaseException &e)
    {
        cerr << "Custom exception: " << e.type << ". " << e.what() << endl;
    }
    catch (exception &e)
    {
        cerr << "STD exception: " << e.what() << endl;
    }
}
