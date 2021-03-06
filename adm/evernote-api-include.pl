#!/usr/local/bin/perl -w
###########################################
# Build the evernote Perl API using Thrift, fix it up, and include 
# it in the distribution of this module for convenience.
# To generate the latest version, download the SDK from Evernote.com and
# run this script.
# 
# Mike Schilli, 2012 (m@perlmeister.com)
###########################################
use strict;
use Sysadm::Install qw(:all);
use File::Find;
use File::Basename;
use Log::Log4perl qw(:easy);
Log::Log4perl->easy_init($DEBUG);

for my $module ( qw( UserStore NoteStore Types ) ) {
    tap "thrift", "-r", "--gen", "perl", "evernote-api/thrift/$module.thrift";
}

for my $dir ( <../lib/Net/Evernote/EDAM*> ) {
    rmf $dir;
}

for my $dir ( <gen-perl/*> ) {
    my $base = basename $dir;
    rename $dir, "../lib/Net/Evernote/$base";
}

find sub {
    my $file = $_;

    if( ! -f $file or ! $file =~ /\.pm$/ ) {
	return;
    }

    INFO "Fixing up $file";

    pie sub {
        s/EDAM(?!_)/Net::Evernote::EDAM/g;
        s/\bnew (.*?)\(/$1->new(/g;
        $_;
    }, $file;

}, "../lib/Net/Evernote/";
