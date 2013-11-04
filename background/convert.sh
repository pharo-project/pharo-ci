#!/bin/bash

convert background.png -flatten -alpha Off background-2.png
mv background-2.png background.png
