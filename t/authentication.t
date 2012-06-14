use strict;
use warnings;

use Net::Evernote;
use Common qw(:DEFAULT $config);;


my $note = Net::Evernote->new(
    $$config{'username'},
    $$config{'password'},
    $$config{'consumer_key'},
    $$config{'consumer_secret'}
);

my $title = "test title from Perl Api";
my $content = "here is some test content";

# write a note
my $res = $note->writeNote($title, $content);
my $guid = $res->guid;

# get the note
my $thisNote = $note->getNote($guid);
print $thisNote->title,"\n";
print $thisNote->content,"\n";

# delete the note
$note->delNote($guid);

# find notes
my $search = $note->findNotes("some words",0,5);
for my $thisNote ( @{$search->notes} ) {
   print $thisNote->guid,"\n";
   print $thisNote->title,"\n";
}