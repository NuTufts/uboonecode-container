#!/bin/bash

#SBATCH --job-name=ubcode-build-tmw
#SBATCH --output=log-ubcode-build-tmw
#SBATCH --partition batch
#SBATCH --time=1-00:00:00
#SBATCH --mem-per-cpu=4000

CONTAINER=/cluster/kappa/90-days-archive/wongjiradlab/larbys/images/singularity-uboonecode/singularity-uboonecode-sl6-v06_26_01_20_e10prof.img
WORKDIR=/cluster/tufts/wongjiradlab/twongj01/uboonecode/dev
WORKDIR_INCONTAINER=/cluster/kappa/wongjiradlab/twongj01/uboonecode/dev

module load singularity
singularity exec ${CONTAINER} bash -c "cd ${WORKDIR_INCONTAINER}/.. && source build_uboonecode.sh ${WORKDIR_INCONTAINER}"