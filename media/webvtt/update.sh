#!/bin/sh
# script to update the webvtt library source

URL=https://github.com/mozilla/webvtt.git
BRANCH=dev
REPO=gunk
SRCDIR=.

rm -rf ${SRCDIR}

if [ -d ${REPO}/.git ]; then
  echo "Updating existing checkout..."
  cd ${REPO} && git fetch && git checkout ${BRANCH} -f && git clean -x -f -d && cd ..
else
  echo "Downloading source from ${URL}"
  git clone ${URL} ${REPO} -b ${BRANCH}
fi
 
#Create directories
mkdir \
  ${SRCDIR} \
  ${SRCDIR}/include \
  ${SRCDIR}/include/webvtt \
  ${SRCDIR}/include/webvttxx \
  ${SRCDIR}/libwebvtt

#Copy C headers
find ${REPO}/include/webvtt -type f -name '[^w]*.h' -exec cp '{}' ${SRCDIR}/include/webvtt/ \;
#Copy C++ headers
find ${REPO}/include/webvttxx -type f -regex '[^.]+$' -exec cp '{}' ${SRCDIR}/include/webvttxx/ \;
#Copy C sources
find ${REPO}/src/libwebvtt -type f -name '*.[ch]' -exec cp '{}' ${SRCDIR}/libwebvtt/ \;
#Copy C++ sources
find ${REPO}/src/libwebvttxx -type f -name '*.cpp' -exec cp '{}' ${SRCDIR}/libwebvtt/ \;

rm -rf ${REPO}

#patch . < update.sh