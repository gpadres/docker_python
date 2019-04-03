#Start from the base image Ubuntu 18.04i
FROM ubuntu:18.04

#Define a few environement variables
ENV PORT 8888

# The following (especially the first) is needed to deal with .deb package
# tzdata, which otherwise would ask for input from the terminal
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ="/usr/share/zoneinfo/Europe/Stockholm"
RUN echo $TZ > /etc/timezone

### Install .deb packages
# apt_packages.list must contain one package per line with an optional comment. The package name *** must be followed by a TAB *** before the comment
COPY apt_packages.list /
RUN apt-get update 1>/dev/null && apt-get install -y `cat /apt_packages.list | awk -F'\t'  '($1!~/^#/) && ($1!~/^$/) {print $1}' ` 1> /dev/null && apt-get clean && rm -rf /var/lib/apt/lists/*

#Install Python and JupyterLab
RUN python3 -m pip install --upgrade pip setuptools
RUN python3 -m pip install --upgrade pyzmq
RUN python3 -m pip install jupyterlab

#Install the Python3 kernel
RUN python3 -m pip install ipykernel && python3 -m ipykernel install

#Install extra python packages defined in the list
# python_packages.list describes one package per line with a structure "name_pkg-TAB-[Python2/Python3/*empty]-TAB-#Comment"
# An empty second columns means the package is installed in both Python2 and Python3.
# Python2 in the second column means that the package should be installed in python2 only.
# Python3 in the second column means that the package should be installed in Python3 only.
COPY python_packages.list /
RUN python3 -m pip install --upgrade `cat python_packages.list | awk -F'\t'  '($1!~/^#/) && ($1!~/^$/) && (($2=="") || ($2=="Python3")) {print $1}' `

#Jupyter will be run rooted into that folder - mount whatever the user needs into that folder
RUN mkdir /data

#Fix some folders and permissions so that the container can be run as non-root
RUN mkdir /.jupyter && mkdir /.local && chmod 777 /.jupyter && chmod 777 /.local
