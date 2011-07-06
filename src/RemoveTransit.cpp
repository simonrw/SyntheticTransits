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

    /*  set up an output file for debugging */
    ofstream debugoutfile("debug.dat");
    debugoutfile.precision(15);

    /*  get the phase values */
    vector<double> modelPhase = model.phase();
    
    /*  set up the output values initially as a copy of the input data */
    Lightcurve output = data;
    
    Linear_interp interpolator(modelPhase, model.flux);
    
    /*  calculate the average of the data */
    double dataAv = 0;
    for (vector<double>::const_iterator i=data.flux.begin();
         i!=data.flux.end();
         ++i)
    {
        dataAv += *i / data.size();
    }


    /*  now interpolate onto the data's phase grid */
    vector<double> dataPhase = data.phase();
    for (size_t i=0; i<dataPhase.size(); ++i)
    {
        double InterpolatedModelValue = interpolator.interp(dataPhase[i]);

        debugoutfile << dataPhase[i] << " " << InterpolatedModelValue <<  " " << data.flux[i] << endl;
    }
    
    /*
     *[>  need to sort the data by phase as well <]
     *[> do not need to sort <]
     *vector<pair<double, int> > SortedDataPhase = SortedIndex(data.phase());
     *vector<double> LCWithFluxRemoved(SortedDataPhase.size());
     *for (size_t i=0; i<SortedDataPhase.size(); ++i)
     *{
     *    [>  get the interpolated value <]
     *    double interpValue = interpolator.interp(SortedDataPhase[i].first);
     *    double fluxval = data.flux[SortedDataPhase[i].second];
     *    
     *    [>  normalise the flux val <]
     *    fluxval /= dataAv;
     *    
     *    debugoutfile << SortedDataPhase[i].first << " " << interpValue << " " << fluxval << " " << setprecision(20) << ((fluxval - interpValue) + 1.0) * dataAv <<  endl;
     *    LCWithFluxRemoved[i] = ((fluxval - interpValue) + 1.0) * dataAv;
     *    
     *}
     */

    debugoutfile.close();
    
        
    
    return output;
        
}
