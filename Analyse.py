#!/usr/bin/env python
# -*- coding: utf-8

import pyfits
from pylab import *
import sys

if len(sys.argv) != 4:
    raise RuntimeError("Program usage: %s oldfile newfile objectid" % sys.argv[0])
