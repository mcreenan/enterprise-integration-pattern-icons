#!/usr/bin/perl

use strict;
use warnings;

my $resize_factor = 0.20;

while (my $file = <*.svg>) {
    open my $IFH, '<', $file or die "Unable to open for reading: $file";
    open my $OFH, '>', "resized/$file" or die "Unable to open file for write: resized/$file";

    while (my $line = <$IFH>) {
        if ($line =~ m/width="(.*)?"/) {
           my $width = $1;
           my $new_width = $width * $resize_factor;
           $line =~ s/width="(.*)?"/width="$new_width"/;
        }
        elsif ($line =~ m/height="(.*)?"/) {
           my $height = $1;
           my $new_height = $height * $resize_factor;
           $line =~ s/height="(.*)?"/height="$new_height"/;
        }
        print $OFH $line;
    }

    close $IFH;
    close $OFH;
}
