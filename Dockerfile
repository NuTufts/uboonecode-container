FROM scientificlinux/sl:6


RUN yum install -y freetype-devel git gitflow wget curl-devel \
         redhat-lsb-core openssh-clients curl-devel libxml2-devel \
	 mesa-libGLU-devel libSM-devel openssl-devel emacs vim && \
	 yum clean all

RUN mkdir /products && \
  wget http://scisoft.fnal.gov/scisoft/bundles/tools/pullProducts && \
  chmod +x pullProducts && \
  ./pullProducts /products slf6 uboone-v06_26_01_20 e10 prof && \
  rm *.tar.bz2

RUN  bash -c "source /products/setup && setup root v6_06_08 -q e10:nu:prof && \
      cd /usr/local && git clone https://github.com/nutufts/larcv2 larcv && cd /usr/local/larcv && \
      source configure.sh && make"

