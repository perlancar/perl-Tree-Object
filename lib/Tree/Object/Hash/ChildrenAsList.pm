package Tree::Object::Hash::ChildrenAsList;

use 5.010001;
use strict;
use warnings;

use Role::Tiny::With;

# AUTHORITY
# DATE
# DIST
# VERSION

with 'Role::TinyCommons::Tree::NodeMethods';

sub new {
    my $class = shift;
    my %attrs = @_;
    $attrs{_parent} //= undef;
    $attrs{_children} //= [];
    bless \%attrs, $class;
}

sub parent {
    my $self = shift;
    $self->{_parent} = $_[0] if @_;
    $self->{_parent};
}

sub children {
    my $self = shift;

    $self->{_children} = $_[0] if @_;
    @{ $self->{_children} };
}

1;
# ABSTRACT: A hash-based tree object, children() returns list

=for Pod::Coverage .+

=head1 SYNOPSIS

 use Tree::Object::Hash::ChildrenAsList;
 my $tree = Tree::Object::Hash::ChildrenAsList->new(attr1 => ..., attr2 => ...);


=head1 DESCRIPTION

This class is exactly like L<Tree::Object::Hash> but its C<children()> returns a
list instead of arrayref. It is used for testing purposes only.


=head1 SEE ALSO

L<Tree::Object::Hash>
