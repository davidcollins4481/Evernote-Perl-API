package Net::Evernote::Tag

use strict;
use warnings;

sub new {
    my ($class, $args) = @_;
    my $debug = $ENV{DEBUG};

    if (!$$args{name} || !$$args{guid}) {
        die "Name or Guid required to create/retrieve a tag\n";
    }

    my $obj = $$args{_obj};
     

    return bless { 
        _obj        => $obj,
        _note_store => $$args{_note_store},
        _dev_token  => $$args{_dev_token},
        debug       => $debug,
        name        => $$args{name},
        guid        => $$args{guid},
    }, $class;
}



sub notes {
    # TODO
}

1;
