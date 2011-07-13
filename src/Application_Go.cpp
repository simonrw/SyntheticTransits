#include <iostream>
#include <cmath>
#include <CCfits/CCfits>
#include <vector>
#include <tclap/CmdLine.h>
#include <sstream>
#include <fstream>
//#include <glog/logging.h>


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



using namespace std;
using namespace CCfits;











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








/**	The main function, abstracted from the main function for good separation
 *
 * Runs all of the later code and garruntees RAII behaviour */
int Application::go(int argc, char *argv[])
{
    /* new main function */
    TCLAP::CmdLine cmd(" ", ' ', "0.9");
    TCLAP::ValueArg<string> addModel_arg("a", "addmodel", "Model to add", true, "", "Model xml file", cmd);
    TCLAP::ValueArg<string> subModel_arg("s", "submodel", "Model to subtract", true, "", "Model xml file", cmd);
    TCLAP::UnlabeledValueArg<string> filename_arg("file", "File", true, "", "Fits file", cmd);
    TCLAP::ValueArg<string> output_arg("o", "output", "Optional output file", false, "output.fits", "Fits filename", cmd);
    TCLAP::ValueArg<string> objectid_arg("O", "object", "Object to alter", true, "", "Object identifier", cmd);
    TCLAP::SwitchArg wasptreatment_arg("w", "wasp", "Do not treat as WASP object", cmd, true);



    cmd.parse(argc, argv);
    
    /*  if the model argument is NULL then do not add a model into the lightcurve */
    bool addModelFlag = true;
    Lightcurve AddModel(0);
    if (addModel_arg.getValue() == "NULL")
    {
        /*  Not adding a model into the lightcurve */
        addModelFlag = false;
        cout << "Not adding a transit" << endl;
    }
    else
    {
        AddModel = GenerateModel(addModel_arg.getValue());
    }



    

    
    Lightcurve SubModel = GenerateModel(subModel_arg.getValue());
    
    /*  start by copying the file across to the output file */
    stringstream copycmd;
    copycmd << "cp " << filename_arg.getValue() << " " << output_arg.getValue();

    system(copycmd.str().c_str());
    
    /*  alter the filename to have a ! in front of it */
    string DataFilename = output_arg.getValue();
    
    /*  print if the object is from wasp or not */
    if (wasptreatment_arg.getValue())
        cout << "WASP object chosen" << endl;
    else
        cout << "Non-WASP object chosen" << endl;
    
    /*  open the fits file */
    mInfile = auto_ptr<FITS>(new FITS(DataFilename, Write));
    
    /*  get the desired index */
    mObjectIndex = ObjectIndex(objectid_arg.getValue());
    
    /*  extract the flux */
    Lightcurve ChosenObject = getObject();
    
    /*  update the period and epoch */
    ChosenObject.period = SubModel.period;
    ChosenObject.epoch = SubModel.epoch;
    
    /*  create the interpolated values */
    //Lightcurve TransitRemovedLC = RemoveTransit(ChosenObject, SubModel);
    

    //[>  now add the transit back in <]
    //Lightcurve TransitAddedLC = AddTransit(TransitRemovedLC, AddModel);
    return 0;

    Lightcurve NewLightcurve = AlterTransit(ChosenObject, SubModel, AddModel, wasptreatment_arg.getValue(), addModelFlag);

    /*  finally update the file */
    UpdateFile(NewLightcurve);



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
    catch (TCLAP::ArgException &e)
    {
        cerr << "TCLAP error: " << e.error() << " for arg " << e.argId() << endl;
    }
    catch (BaseException &e)
    {
        cerr << "Custom exception: " << e.what() << endl;
    }
    catch (exception &e)
    {
        cerr << "STD exception: " << e.what() << endl;
    }
}
