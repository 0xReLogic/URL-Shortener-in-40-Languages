#!/usr/bin/perl
use strict;
use warnings;

package URLShortener;

sub new {
    my $class = shift;
    my $self = {
        urls => {}
    };
    bless $self, $class;
    return $self;
}

sub shorten {
    my ($self, $url) = @_;
    my $short = $self->generate_short_code(6);
    $self->{urls}->{$short} = $url;
    return $short;
}

sub get_url {
    my ($self, $short) = @_;
    return $self->{urls}->{$short};
}

sub generate_short_code {
    my ($self, $length) = @_;
    my $characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    my $short = "";
    
    for (1..$length) {
        my $index = int(rand(length($characters)));
        $short .= substr($characters, $index, 1);
    }
    
    return $short;
}

# Example usage
my $shortener = URLShortener->new();
my $short = $shortener->shorten("https://www.example.com");
print "Short URL: $short\n";
my $original = $shortener->get_url($short);
print "Original URL: " . ($original // "undef") . "\n";
