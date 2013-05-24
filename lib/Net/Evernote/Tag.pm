package Net::Evernote::Tag;

use strict;
use warnings;

sub new {
    my ($class, $args) = @_;
    my $debug = $ENV{DEBUG};

    if (!$$args{_obj} && !$$args{name} && !$$args{guid}) {
        die "Name or Guid required to create/retrieve a tag\n";
    }

    my $obj = $$args{_obj};

    return bless { 
        _obj        => $obj,
        _dev_token  => $$args{_dev_token},
        debug       => $debug,
        name        => $$args{name},
        guid        => $$args{guid},
    }, $class;
}

sub notes {
    # TODO
}

# the magic
sub AUTOLOAD {
    my ($self,@args) = @_;
    our ($AUTOLOAD);
    my $method = $AUTOLOAD;
    $method =~ s/.*:://;

    if ($self->{_obj}->can($method)) {
        return $self->{_obj}->$method;
    } else {
        return undef;
    }
}
1;
