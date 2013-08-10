#!/bin/bash
#       MYMETA.json
#       MYMETA.yml
#       Makefile
#       Net-Evernote-0.06.tar.gz
#       package.sh

#tar zvcf Net-Evernote-0.07.tgz Changes ignore.txt lib/ Makefile.PL MANIFEST README t/
perl Makefile.PL
make dist
rm MYMETA.* Makefile


