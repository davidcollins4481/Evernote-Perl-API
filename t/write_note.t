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

my $note_title = 'test title';

my $note = $evernote->writeNote({
    title => $note_title,
    content => 'here is some test content',
});

my $guid = $note->guid;

my $new_note = $evernote->getNote({
    guid => $guid,
});

ok($guid eq $new_note->guid, 'New note successfully retrieved');

# NOTE: content returns with markup so not testing that here
ok($note_title eq $new_note->title, 'Title of new note successfully retrieved');

$evernote->deleteNote({
    guid => $guid
});