#!/usr/bin/env python
# -*- coding: utf-8 -*-

import pyfits
from pylab import *

filename = "Debug.dat"
wasp12model = "WASP12Model.dat"

jd, orig, sub, add = loadtxt(filename, unpack=True)
mjd, mflux = loadtxt(wasp12model, unpack=True, usecols=(0, 1))


wasp12 = {'period': 1.0914222,
        'epoch': 2454508.97605
        }

wasp11 = {'period': 3.722469,
        'epoch': 2454729.90631
        }


wasp11phase = ((jd - wasp11['epoch']) / wasp11['period']) % 1
wasp12phase = ((jd - wasp12['epoch']) / wasp12['period']) % 1

wasp11phase[wasp11phase>0.5] -= 1.0
wasp12phase[wasp12phase>0.5] -= 1.0

wasp12ModelPhase = ((mjd - wasp12['epoch']) / wasp12['period']) % 1
wasp12ModelPhase[wasp12ModelPhase>0.5] -= 1.0

plot(wasp11phase, orig, 'r,', label="Original")
plot(wasp12phase, add, 'g,', label='WASP12 added')

lims = xlim()
plot(wasp12ModelPhase, mflux * average(add), 'b,')
xlim(lims[0], lims[1])

legend(loc="best")


show()
