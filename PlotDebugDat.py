#!/usr/bin/env python

import sys
from pylab import *
import os.path

sys.path.insert(0, os.path.join(os.path.expanduser("~"), 'build/Python/modules'))
from jg.ctx import wd2jd

wasp12 = {'e': 2454508.97605,
        'p': 1.0914222}

wasp11 = {'e': 2454729.90631,
        'p': 3.722469}

wd, orig, sub, add = loadtxt("Debug.dat", unpack=True)
jd = wd2jd(wd)

goodind = orig==orig
jd = jd[goodind]
orig = orig[goodind]
sub = sub[goodind]
add = add[goodind]

avflux = average(orig)

wasp12phase = ((jd - wasp12['e']) / wasp12['p']) % 1
wasp12phase[wasp12phase>0.5] -= 1.0

wasp11phase = ((jd - wasp11['e']) / wasp11['p']) % 1
wasp11phase[wasp11phase>0.5] -= 1.0

fig = figure(figsize=(11, 8))
fig.suptitle("Transit synthesis\nSubtracting WASP-12b and adding WASP-11b")
ax = fig.add_subplot(221)
ax.plot(wasp12phase, orig / avflux, 'k,')
ax.set_ylabel("Original lightcurve")

ax2 = fig.add_subplot(222, sharex=ax, sharey=ax)
ax2.plot(wasp12phase, sub / avflux, 'k,')
ax2.set_ylabel("Transit removed")


ax3 = fig.add_subplot(223, sharex=ax, sharey=ax)
ax3.plot(wasp12phase, 1. + ((orig - sub) / avflux), 'k,')
ax3.set_ylabel("Difference")

ax4 = fig.add_subplot(224, sharex=ax, sharey=ax)
ax4.plot(wasp11phase, add / avflux, 'k,')
ax4.set_ylabel("WASP-11b added")

ax4.set_xlim(-0.35, 0.35)
ax4.set_ylim(0.8, 1.2)

fig.text(0.5, 0.02, "Orbital phase", va='center', ha='center')
show()
