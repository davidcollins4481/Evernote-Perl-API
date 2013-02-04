use strict;
use warnings;
use Test::More qw(no_plan);
use FindBin;
use lib $FindBin::Bin;
use Net::Evernote;

use Common qw(:DEFAULT $config);

BEGIN { use_ok('Net::Evernote') };

my $evernote = Net::Evernote->new({
    auth_token => $$config{'auth_token'}
});

ok($evernote->authenticated eq 1, 'Successfully authenticated user');