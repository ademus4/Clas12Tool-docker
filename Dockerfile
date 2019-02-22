FROM ademus4/root-6-14:latest
USER root
WORKDIR /work
ENV HOME /work

# set environment variables
## root
ENV DISPLAY localhost:0.0
ENV ROOTSYS /usr/local/bin/root

# install general software
RUN yum install -y pico

# set clas12tool variables
ENV CLAS12TOOL /work/Clas12Tool/

# HIPO
RUN git clone --recurse-submodules https://github.com/dglazier/Clas12Tool.git \
&& cd Clas12Tool \
&& git checkout mesonex4
RUN cd Clas12Tool/Lz4 && make

# general environment variables
ADD environment.sh .bashrc

# make sure the work directory can be modified by any user
RUN chmod -R 777 /work
