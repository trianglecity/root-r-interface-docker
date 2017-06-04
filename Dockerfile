FROM ubuntu:16.04

RUN	apt-get update  -y
RUN	apt-get install -y software-properties-common
RUN	apt-get update  -y
RUN	apt-get install -y python-software-properties 
RUN	apt-get update  -y

RUN	apt-get install -y maven && \
	apt-get install -y dpkg-dev

RUN	apt-get install -y libssl-dev && \
	apt-get install -y libffi-dev && \
	apt-get install -y openssl && \
	apt-get install -y libpcre3-dev && \ 
	apt-get install -y xlibmesa-glu-dev && \ 
	apt-get install -y libglew1.5-dev && \ 
	apt-get install -y libftgl-dev && \ 
	apt-get install -y libmysqlclient-dev && \ 
	apt-get install -y libfftw3-dev && \ 
	apt-get install -y libcfitsio-dev && \ 	
	apt-get install -y graphviz-dev && \ 
	apt-get install -y libavahi-compat-libdnssd-dev && \ 
	apt-get install -y libldap2-dev
	


RUN	apt-get install -y curl && \
	apt-get install -y git && \
	apt-get install -y iptables && \
	apt-get install -y less && \
	apt-get install -y vim && \
	apt-get install -y vim-common && \
	apt-get install -y tar && \
	apt-get install -y zip && \
	apt-get install -y unzip

RUN	apt-get install -y build-essential && \
 	apt-get install -y apt-utils && \
	apt-get install -y automake && \
	apt-get install -y cmake && \
	apt-get install -y gcc && \
	apt-get install -y gcc-4.9 && \
	apt-get install -y g++ && \
	apt-get install -y g++-4.9 && \
	apt-get install -y gcc-multilib && \
	apt-get install -y libgomp1 && \
	apt-get install -y pkg-config && \
	apt-get install -y sphinx-common && \
	apt-get install -y gfortran && \
	apt-get install -y maven && \
	apt-get install -y libtool 

RUN	apt-get install -y wget


RUN	apt-get install -y openssl && \
	apt-get install -y zlib1g-dev && \
	apt-get install -y linux-headers-generic

RUN	apt-get install -y libblas-dev && \
	apt-get install -y liblapack-dev

RUN	apt-get install -y libreadline-dev && \
	apt-get install -y readline-common && \
	apt-get install -y libx11-dev && \
	apt-get install -y libxau-dev && \
	apt-get install -y libxext-dev && \
	apt-get install -y libxmu-headers && \
	apt-get install -y libxrandr-dev && \
	apt-get install -y libxpm-dev && \
	apt-get install -y libxft-dev && \
	apt-get install -y xorg-dev && \
	apt-get install -y libbz2-dev && \
	apt-get install -y liblzma-dev && \
	apt-get install -y libpcre3-dev && \
	apt-get install -y libcurl4-gnutls-dev && \
	apt-get install -y libcurl4-openssl-dev && \
	apt-get install -y libjpeg-dev && \
	apt-get install -y libtiff5-dev && \
	apt-get install -y libtiff-tools && \
	apt-get install -y libcairo2-dev && \
	apt-get install -y libicu-dev && \
	apt-get install -y libqpdf-dev && \
	apt-get install -y cups-pdf && \
	apt-get install -y firefox && \
	apt-get install -y libevince-dev && \
	apt-get install -y evince && \
	apt-get install -y evince-common && \
	apt-get install -y xpdf	&& \
	apt-get install -y ghostscript && \
	apt-get install -y texlive-latex-base && \
	apt-get install -y texlive-fonts-extra && \
	apt-get install -y texinfo

RUN	apt-get install -y yasm  && \
	apt-get install -y libxext-dev  && \
	apt-get install -y libfreetype6-dev  && \
	apt-get install -y libsdl2-dev  && \
	apt-get install -y libtheora-dev  && \
	apt-get install -y libtool  && \
	apt-get install -y libva-dev  && \
	apt-get install -y libvdpau-dev  && \
	apt-get install -y libvorbis-dev  && \
	apt-get install -y libxcb1-dev  && \
	apt-get install -y libxcb-shm0-dev  && \
	apt-get install -y libxcb-xfixes0-dev  && \
	apt-get install -y zlib1g-dev 

RUN	apt-get install -y libjpeg-dev && \
	apt-get install -y libtiff5-dev && \
	apt-get install -y libfreetype6-dev && \
	apt-get install -y libpng12-dev

RUN	apt-get install -y binutils && \
	apt-get install -y python-dev && \
	apt-get install -y python-pip && \
	apt-get install -y python-numpy && \
	apt-get install -y python-numpy-dev && \
	apt-get install -y python-matplotlib && \
	apt-get install -y python-nose && \
	apt-get install -y python-sphinx && \
	apt-get install -y python-pydot && \
	apt-get install -y ipython && \
	apt-get install -y ipython-notebook 

RUN	apt-get install -y libxml2-dev && \
	apt-get install -y libkrb5-dev && \
	apt-get install -y libgsl0-dev	&& \
	apt-get install -y libqt4-dev && \
	apt-get install -y r-base && \
	apt-get install -y r-base-dev

COPY	Rcpp_0.12.11.tar.gz 	/
COPY	RInside_0.2.14.tar.gz 	/

RUN	R CMD INSTALL Rcpp_0.12.11.tar.gz
RUN	R CMD INSTALL RInside_0.2.14.tar.gz


RUN 	mkdir /install && \
	cd /install  && \
	git clone http://root.cern.ch/git/root.git && \
	cd root && \
	mkdir compile && \
	cd compile && \
	cmake -Dr=ON .. && \
	make && \
	cd ../.. 
	

ENV	ROOTSYS /install/root/compile
ENV 	PATH="${ROOTSYS}/bin:${PATH}"
ENV	LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:${ROOTSYS}/lib"

COPY	MASS_7.3-47.tar.gz 	/
RUN	R CMD INSTALL MASS_7.3-47.tar.gz
