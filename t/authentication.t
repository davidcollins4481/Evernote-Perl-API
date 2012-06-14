use strict;
use warnings;

use Net::Evernote;
use Common qw(:DEFAULT $config);;


my $evernote = Net::Evernote->new(
    $$config{'username'},
    $$config{'password'},
    $$config{'consumer_key'},
    $$config{'consumer_secret'}
);