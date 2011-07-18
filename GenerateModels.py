#!/usr/bin/env python

import sys
import os
import re
import os.path
import argparse
#from subprocess import Popen, call, PIPE, STDOUT
#import matplotlib.pyplot as plt
import numpy as np
from shutil import rmtree
#import srw
#from IPython.Shell import IPShellEmbed
#import pyfits

def AskUserForRadiusParams():
    minrad = float(raw_input("Enter minimum radius (MJ): "))
    maxrad = float(raw_input("Enter maximum radius (MJ): "))
    radstep = float(raw_input("Enter radius step (MJ): "))

    radVals = [minrad, maxrad, radstep]

    return radVals



def main(args):
    originalModelCodeFile = open(args.OriginalModel, 'r')
    originalModelCode = originalModelCodeFile.readlines()
    originalModelCodeFile.close()



    # try and get the radius from the command line
    radVals = args.radius

    # radVals will either be None or a 2d list with 3 elements
    if not radVals:
        radVals = AskUserForRadiusParams()
    else:
        radVals = radVals[0]


    # try and make the output directory
    outputPath = os.path.abspath(args.outputdir)

    try:
        os.mkdir(outputPath)
    except OSError:
        # path already exists
        if args.force:
            rmtree(outputPath)
            os.mkdir(outputPath)
        else:
            overwriteDecision = raw_input("Output directory already exists, overwrite? [y/N] ")
            if overwriteDecision.upper() == "Y" or overwriteDecision.upper() == "YES":
                rmtree(outputPath)
                os.mkdir(outputPath)
            else:
                raise OSError("Cannot create output directory")

    # ensure that radVals[0] < radVals[1]
    assert radVals[0] < radVals[1], 'Minimum radius must be < maximum radius'


    # set up the regex object

    for r in np.arange(radVals[0], radVals[1]+radVals[2], radVals[2], dtype='float32'):
        filename = "Model_r=%.5f.xml" % r
        fullPath = os.path.join(outputPath, filename)

        outputFile = open(fullPath, 'w')

        InsidePlanetSection = False
        for line in originalModelCode:
            if "<planet" in line:
                InsidePlanetSection = True
                outputFile.write(line)

            elif "</planet" in line:
                InsidePlanetSection = False
                outputFile.write(line)

            elif "<radius" in line:
                if InsidePlanetSection:
                    # the line of interest
                    splitline = line.split()
                    # parse the list for the val bit

                    newSections = []
                    for sub in splitline:
                        if "val" in sub:
                            # found it
                            newSections.append("val=\"%f\"" % r)
                        else:
                            newSections.append(sub)

                    newLine = " ".join(newSections)
                    if "/>" not in line:
                        newLine += "/>"

                    outputFile.write(newLine)

                else:
                    outputFile.write(line)

            else:
                outputFile.write(line)


        outputFile.close()





if __name__ == '__main__':
    try:
        parser = argparse.ArgumentParser()

        parser.add_argument("OriginalModel")

        parser.add_argument("-r", "--radius", help='Radius parameters',
                action='append', type=float, nargs=3, required=False)

        parser.add_argument("-f", '--force', help="Overwrite output directory",
                default=False, action="store_true")

        parser.add_argument("-o", "--outputdir", help='Output directory',
                default='output')

        args = parser.parse_args()
        main(args)
    except KeyboardInterrupt:
        print >> sys.stderr, "Interrupt caught, exiting..."
        sys.exit(0)
    #except Exception, e:
        #print >> sys.stderr, e
        #sys.exit(1)
