package SoggyOnion::Plugin;
use warnings;
use strict;

# this is called before we call mod_time and/or content. i use it to set
# the useragent in LWP::Simple in a few modules
sub init {}

# simple constructor that wants a hash of options.
sub new {
    my ( $class, $data ) = @_;
    warn "$class\::new() must be passed a hash ref" && return
        unless ref $data eq 'HASH';
    bless $data, $class;
    $data->init;
    return $data;
}

# the ID is used for <DIV> tags and internal caching stuff. this is
# a simple accessor that makes the code cleaner.
sub id {
    my $self = shift;
    return $self->{id};
}

# the default mod_time method ensures that the resource is always
# refreshed (cache is never used)
sub mod_time { time };

# default content stub
sub content { qq(<p class="error">This is the output of the default plugin class. Something strange has occurred.</p>\n) }

1;

__END__

=head1 NAME

SoggyOnion::Plugin - how to extend SoggyOnion

=head1 SYNOPSIS

    # sample plugin that uses a file as its resource.
    # needs a 'filename' key in the item hash in the config
    package SoggyOnion::Plugin::File;
    
    sub init {
        my $self = shift;
        die "I have no filename" 
            unless exists $self->{filename};
    }
    
    sub mod_time {
        my $self = shift;
        return [ stat $self->{filename} ]->[9];
    }
    
    sub content {
        open( FH, "<$self->{filename}" ) or die $!
        my $data = join('', <FH>);
        close FH;
        return $data;
    }


=head1 DESCRIPTION

Docs to be added later.

=head1 SEE ALSO

L<SoggyOnion>

=head1 AUTHOR

Ian Langworth E<lt>ian@E<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2004 by Ian Langworth

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
