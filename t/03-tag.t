use strict;
use warnings;
use Test::More qw(no_plan);

use FindBin;
use lib $FindBin::Bin;
use Net::Evernote;

use Common qw(:DEFAULT $config);

my $evernote = Net::Evernote->new({
    developer_token => $$config{'developer_token'},
    use_sandbox => 1,
});

# create a tag
my $tag = $evernote->createTag({'name' => 'test tag' });


# create a note and apply the tag



# retrieve the tag and it's notes



