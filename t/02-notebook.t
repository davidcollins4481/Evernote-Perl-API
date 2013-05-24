use strict;
use warnings;

use Test::More qw(no_plan);
use Net::Evernote;
use FindBin;

use lib $FindBin::Bin;
use Common qw(:DEFAULT $config);

my $evernote = Net::Evernote->new({
    developer_token => $$config{'developer_token'},
    use_sandbox => 1,
});


