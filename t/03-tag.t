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

my $tag_name = 'test tag-' . time;
my ($tag_guid, $note_guid);

# create a tag
{
    my $tag = $evernote->createTag({'name' => $tag_name });
    ok($tag->name eq $tag_name, "Tag name retrieved");
    $tag_guid = $tag->guid;
    isnt($tag_guid, '', "Tag has GUID (${tag_guid})");
}

# create a note and apply the tag
{
    my $note = $evernote->createNote({
        title     => 'tag tester',
        content   => 'tag test content',
        tag_guids => [$tag_guid],
    });

    $note_guid = $note->guid;
}

# retrieve the tag and it's notes
{
    my $tag = $evernote->getTag({
        guid => $tag_guid, 
    });

    is($tag->guid, $tag_guid, "Tag retrieved by GUID (${tag_guid})");

    my $note = $evernote->getNote({
        guid => $note_guid,
    });

    my $tagGuids = $note->tagGuids;

    # only set one...check that
    my $firstTagGuid = $$tagGuids[0];
    is($firstTagGuid, $tag_guid, "Tag successfully attached to note");
    # delete tag and note
    $note->delete;
    $tag->delete;
}


