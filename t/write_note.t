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
my $note_tags  = [qw(testTag1 testTag2)];

my $note = $evernote->writeNote({
    title     => $note_title,
    content   => 'here is some test content',
    tag_names => $note_tags
});

my $guid = $note->guid;

my $new_note = $evernote->getNote({
    guid => $guid,
});

ok($guid eq $new_note->guid, 'New note successfully retrieved');

# NOTE: content returns with markup so not testing that here
ok($note_title eq $new_note->title, 'Title of new note successfully retrieved');

my $tags = $new_note->tagNames;
ok(@$tags ~~ @$note_tags, "Tags look good");

# delete the test note
$evernote->deleteNote({
    guid => $guid
});

my $deleted_note = $evernote->getNote({
    guid => $guid,
});

ok($deleted_note->deleted ne '', "Note deleted")

# Hmmm...what to do with the tags? I don't want to accidentally delete a tag from someone's
# Evernote account that previously existed. Maybe a huge random tag or something?