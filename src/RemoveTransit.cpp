#include "RemoveTransit.h"
#include <vector>

#define _USESTDVECTOR_
#include <nr/nr3.h>
#include <nr/interp_1d.h>
#include <nr/interp_linear.h>

using namespace std;


bool PairComparitor(const pair<double, int> &val1, const pair<double, int> &val2)
{
    return (val1.first < val2.first);
}

Lightcurve RemoveTransit(Lightcurve &data, Lightcurve &model)
{
    /** 
     * \bug Code does not take into account nans 
     * */


    /*  get the phase values */
    vector<double> modelPhase = model.phase();
    /*  first sort the model by phase */
    vector<pair<double, int> > SortedModelPhase = SortedIndex(model.phase());
    
    /*  set up the output values initially as a copy of the input data */
    Lightcurve output = data;
    
    /*  now set up the interpolator */
    vector<double> phase(model.size()), modelflux(model.size());
    for (size_t i=0; i<model.size(); ++i)
    {
        pair<double, int> row = SortedModelPhase[i];
        phase[i] = row.first;
        modelflux[i] = model.flux[SortedModelPhase[i].second];
        
        
    }
    Linear_interp interpolator(phase, modelflux);
    
    /*  calculate the average of the data */
    double dataAv = 0;
    for (vector<double>::const_iterator i=data.flux.begin();
         i!=data.flux.end();
         ++i)
    {
        dataAv += *i / data.size();
    }

    /*  set up an output file for debugging */
    ofstream debugoutfile("debug.dat");
    debugoutfile.precision(15);
    
    /*  need to sort the data by phase as well */
    /* do not need to sort */
    vector<pair<double, int> > SortedDataPhase = SortedIndex(data.phase());
    vector<double> LCWithFluxRemoved(SortedDataPhase.size());
    for (size_t i=0; i<SortedDataPhase.size(); ++i)
    {
        /*  get the interpolated value */
        double interpValue = interpolator.interp(SortedDataPhase[i].first);
        double fluxval = data.flux[SortedDataPhase[i].second];
        
        /*  normalise the flux val */
        fluxval /= dataAv;
        
        debugoutfile << SortedDataPhase[i].first << " " << interpValue << " " << fluxval << " " << setprecision(20) << ((fluxval - interpValue) + 1.0) * dataAv <<  endl;
        LCWithFluxRemoved[i] = ((fluxval - interpValue) + 1.0) * dataAv;
        
    }

    debugoutfile.close();
    
//    interpFile.close();
        
        
    for (size_t i=0; i<LCWithFluxRemoved.size(); ++i)
    {
        output.flux[i] = LCWithFluxRemoved[SortedDataPhase[i].second];
    }
    
    return output;
        
}
