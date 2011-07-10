#!/usr/bin/env python

import sys

sys.path.insert(0, "/opt/local/lib/python2.5/site-packages")
sys.path.insert(0, "/opt/local/Library/Frameworks/Python.framework/Versions/Current/lib/python2.6/site-packages/")

import pyfits
import os
from pylab import *



class CustomException(Exception):
    def __init__(self, msg):
        self.msg = msg

    def __str__(self):
        return self.msg


if len(sys.argv) != 2:
    raise CustomException("Program usage: %s <filename>" % (sys.argv[0],))

WASP12ObjectID = "1SWASP J063032.79+294020.4"

# read in the data file first
filename = sys.argv[1]
OutputFilename = "SyntheticLightcurve.fits"
x, y = loadtxt(filename, unpack=True)

avflux = average(y, weights=sqrt(y))


phdu = pyfits.PrimaryHDU()
phdu.header.update('LCTYPE', 'Synthetic', 'Type of lightcurves stored')

# create the data values
hjdHDU = pyfits.ImageHDU(x)
hjdHDU.header.update("EXTNAME", "HJD", "")
fluxHDU = pyfits.ImageHDU(y)
fluxHDU.header.update("EXTNAME", "FLUX", "")
fluxerrHDU = pyfits.ImageHDU(sqrt(y))
fluxerrHDU.header.update("EXTNAME", "FLUXERR", "")

# create the table
# create the columns
obj_id = array([WASP12ObjectID,])
fluxmean = array([avflux,])

obj_id_col = pyfits.Column(name='OBJ_ID', format='26A', array=obj_id)
fluxmean_col = pyfits.Column(name='FLUXMEAN', format='1D', array=fluxmean)
cols = pyfits.ColDefs([obj_id_col, fluxmean_col])
catalogueHDU = pyfits.new_table(cols)
catalogueHDU.header.update("EXTNAME", "CATALOGUE", "")

hdulist = pyfits.HDUList([
    phdu,
    catalogueHDU,
    hjdHDU,
    fluxHDU,
    fluxerrHDU,
    ])

try:
    hdulist.writeto(OutputFilename)
except IOError:
    # file must already exist
    os.system("rm %s" % (OutputFilename))
    hdulist.writeto(OutputFilename)
