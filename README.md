# uboonecode-container

Docker and singularity file to build uboonecode containers.

This takes advantage of scisoft and an utility script, `pullProducts`. The code is built on top of Scientific Linux 6.

Given a tagged-release version of uboonecode, pullProducts, untars all dependencies into the `/products` folder.

Once built, one can go into the container and setup UPS, which is the utilty to setup different software products, by sourcing

    source /products/setup


For example, one can then list the version of uboonecode stored in the container

    ups list -aK+ uboonecode

## Build Docker image

Of course, you need to install docker.

To build the image

    sudo docker build -t [container_name:tag] .

Note that the last step of the Dockerfile installs LArCV2.
This is used by our group to make truth-labeled training data.

## Run the Docker image

To run the image

    docker run -it [container_name:tag] bash

Setup uboonecode

    setup uboonecode [version] [qualifier]


Run larsoft

    lar -c [fcl file] -s [input file]

## Build a singularity image, based on the docker image

We use singularity's feature of importing a docker image.
To do that, we have to push the docker image to dockerhub.
You'll need a dockerhub account.

Once you get an account, push to dockerhub

    docker login
    docker push [container_name:tag]

Then build the singularity image. Note that the build file has extra folders created to allow
network folders to be mounted on the Tufts Cluster.

    sudo singularity build [output_image_name] Singularity
    
## Run the singularity image

Start the singularity container by

    singularity shell [container image]
    prompt> bash
    
Then follow the instructions for the docker image to run `lar` or build a development copy.

## Setup and build a development copy

Have confirmed that one can also setup and build a development version as well.

    source /products/setup
    setup mrb
    mkdir workdir
    cd workdir
    setup uboonecode [version] [qualifier]
    export MRB_PROJECT=larsoft
    mrb newDev
    source localProducts-XXXX/setup
    cd srcs
    mrb g uboonecode
    mrbsetenv
    mrb i

### Helper scripts

The repo also contains scripts to launch a job to build a development setup on the Tufts cluster.
