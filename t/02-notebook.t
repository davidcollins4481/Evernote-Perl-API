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

my $notebookName = 'test_notebook-'. time;
my $notebookGuid;

# create a notebook
{
    my $notebook = $evernote->createNotebook({
        name => $notebookName,
    });

    $notebookGuid = $notebook->guid;

    isnt($notebookGuid, '', "Notebook created with GUID ${notebookGuid}");

}


