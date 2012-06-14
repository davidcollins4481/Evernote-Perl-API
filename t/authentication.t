use strict;
use warnings;
use Test::More qw(no_plan);
use FindBin;
use lib $FindBin::Bin;
use Net::Evernote;

use Common qw(:DEFAULT $config);

BEGIN { use_ok('Net::Evernote') };

my $evernote = Net::Evernote->new(
    $$config{'username'},
    $$config{'password'},
    $$config{'consumer_key'},
    $$config{'consumer_secret'}
);

ok($evernote->userId, "User authenticated")

