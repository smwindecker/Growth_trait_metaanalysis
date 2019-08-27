FROM rocker/verse:3.6.1
LABEL maintainer="Daniel Falster"
LABEL email="daniel.falster@unsw.edu.au"

# Install major libraries
RUN    apt-get update \
    && apt-get install -y --no-install-recommends \
         zip \
         unzip

# ---------------------------------------------
# Add custom install here

# Install packages
RUN . /etc/environment \
  && install2.r --error --r "https://mran.revolutionanalytics.com/snapshot/2019-07-23/" \
  bibtex\
  downloader\
  gridExtra\
  lme4\
  metafor\
  tinytex\
  plyr
 
# ---------------------------------------------

ENV NB_USER rstudio
ENV NB_UID 1000

# And set ENV for R! It doesn't read from the environment...
RUN echo "PATH=${PATH}" >> /usr/local/lib/R/etc/Renviron
RUN echo "export PATH=${PATH}" >> ${HOME}/.profile

# The `rsession` binary that is called by nbrsessionproxy to start R doesn't seem to start
# without this being explicitly set
ENV LD_LIBRARY_PATH /usr/local/lib/R/lib

ENV HOME /home/${NB_USER}
WORKDIR ${HOME}
