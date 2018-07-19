# uboonecode-container

Docker and singularity file to build uboonecode containers.

This takes advantage of scisoft and an utility script, `pullProducts`. The code is built on top of Scientific Linux 6.

Given a tagged-release version of uboonecode, pullProducts, untars all dependencies into the `/products` folder.

Once built, one can go into the container and setup UPS, which is the utilty to setup different software products, by sourcing

    source /products/setup


For example, one can then list the version of uboonecode stored in the container

    ups list -aK+ uboonecode

Note that the last step of the dockerfile also install LArCV2.
This is used by our group to make truth-labeled training data.

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
