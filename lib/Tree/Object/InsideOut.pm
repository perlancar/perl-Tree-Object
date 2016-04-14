package Tree::Object::InsideOut;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

use Class::InsideOut qw(public register id);

public parent   => my %parent;
public children => my %children;

use Role::Tiny::With;

with 'Role::TinyCommons::Tree::NodeMethods';

sub new {
    my $self = register(shift);
    $children{ id $self } //= [];
    $self;
}

1;
# ABSTRACT: A tree object using Class::InsideOut

=for Pod::Coverage ^(new)$

=head1 SYNOPSIS

 use Tree::Object::InsideOut;
 my $tree = Tree::Object::InsideOut->new();


=head1 DESCRIPTION

This module lets you create a L<Class::InsideOut>-based (instead of regular
hash-backed) tree object. To subclass this class, please see the documentation
of Class::InsideOut.


=head1 SEE ALSO
