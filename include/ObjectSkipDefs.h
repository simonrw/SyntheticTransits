#ifndef OBJECTSKIPDEFS_H

#define OBJECTSKIPDEFS_H

/** Namespace for detrending altering */
namespace AlterDetrending
{
    /** Enum for the alter lightcurve flag
     
     0 is for not altering the lightcurve
     1 is for skipping sysrem detrending
     2 is for skipping tfa detrending
     3 is for skiping both */
    enum
    {
        include,
        skipsysrem,
        skiptfa,
        skipboth
    };
}



#endif /* end of include guard: OBJECTSKIPDEFS_H */
