#!/usr/bin/env python

import pyfits
from pylab import *

import sys
sys.path.insert(0, "/Users/phrfbf/build/Python/modules")
sys.path.insert(0, "/home/astro/phrfbf/build/Python/modules")
from jg.ctx import wd2jd

wasp11 = {'p': 3.722469, 'e': 2454729.90631}

filename = sys.argv[1]

obj_id = "1SWASP J063032.79+294020.4"
f = pyfits.open(filename)
obj_id_list = f['catalogue'].data.field("OBJ_ID")

index = where(obj_id_list==obj_id)[0][0]



try:
    wd = f['hjd'].section[index, :]
except IndexError:
    wd = f['hjd'].data

try:
    flux = f['flux'].section[index, :]
except IndexError:
    flux = f['flux'].data

jd = wd2jd(wd)



wasp11phase = ((jd - wasp11['e']) / wasp11['p']) % 1
wasp11phase[wasp11phase>0.5] -= 1.0

avflux = average(flux[(flux==flux) & 
    # only select oot data
    (wasp11phase<-0.2) | (wasp11phase>0.2)])


plot(wasp11phase, flux / avflux, 'r,')
xlim(-0.35, 0.35)
ylim(0.8, 1.2)
show()
