package Net::Evernote::Notebook;

use strict;
use warnings;

sub new {
    my ($class, $args) = @_;
    my $debug = $ENV{DEBUG};
    my $obj = $$args{_obj};

    return bless { 
        _obj        => $obj,
        _dev_token  => $$args{_dev_token},
        debug       => $debug,
        name        => $$args{name},
        guid        => $$args{guid},
    }, $class;
}

#sub notes {
#    # TODO
#}

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

=head1 NAME

Net::Evernote::Notebook

=head1 VERSION

Version 0.06


=head1 SYNOPSIS

    use Net::Evernote;
    use Net::Evernote::Notebook;

    my $evernote = Net::Evernote->new({
        authentication_token => $authentication_token
    });

    my $notebook = $evernote->createNotebook({
        name => 'notebook name',
    });

    my $notebookGuid = $notebook->guid;
    my $note = $evernote->createNote({
        title         => 'test title',
        content       => 'test content',
        notebook_guid => $notebookGuid,
    });

=head1 SEE ALSO

http://www.evernote.com/about/developer/api/


=head1 AUTHOR

David Collins <davidcollins4481@gmail.com>

=head1 BUGS/LIMITATIONS

If you have found bugs, please send email to <davidcollins4481@gmail.com>


=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Net::Evernote::Notebook


=head1 COPYRIGHT & LICENSE

Copyright 2013 David Collins, all rights reserved.

This program is free software; you can redistribute it and/or modify 
it under the same terms as Perl itself.
