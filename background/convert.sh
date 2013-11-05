#!/bin/bash

# Make sure that the png will look good on Mac OS X when set as a
# folder background
convert background.png -flatten -alpha Off -density 28.35x28.35 \
    -units PixelsPerCentimeter background.temp.png

mv background.temp.png background.png
