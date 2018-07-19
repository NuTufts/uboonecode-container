#!/bin/bash

# This runs inside the container and builds the container
# We assume you did the first-time setup already

WORKDIR_INCONTAINER=$1

# setup UPS products
source /products/setup

# seutp MRB
setup mrb

# go to the working directory
cd $WORKDIR_INCONTAINER
source localProducts_larsoft_v06_26_01_14_e10_prof/setup

# setup the working directory
mrbsetenv

# setup larcv
cd /usr/local/larcv
source configure.sh

# go back to the work directory
cd $WORKDIR_INCONTAINER

# go into the sources folder
cd srcs/uboonecode

# good luck
mrb i


