package Net::Evernote::Note;

use warnings;
use strict;

sub new {
    my ($class, $args) = @_;
    my $debug = $ENV{DEBUG};

    
    return bless { 
        _obj  => $$args{_obj},
        debug => $debug,
    }, $class;
}

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
__END__

Basic idea is that this class will act as a pretty simple wrapper. I would like to store 
a reference to the EDAMTypes::Note object and export a simple interface from here.

The intent is for objects of this type to ONLY be instantiated inside of Net::Evernote.pm

The goal is to use AUTOLOAD to allow calls to methods that don't exist here to then attempt 
to go through to the EDAMTypes::Note obj and return the value there. This way, it's not a 
huge necessity to mimic ALL of the functionality that's already built into the sdk.

1;