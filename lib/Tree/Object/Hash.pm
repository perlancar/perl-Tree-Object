package Tree::Object::Hash;

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
    $self->{_children};
}

1;
# ABSTRACT: A hash-based tree object

=head1 SYNOPSIS

 use Tree::Object::Hash;
 my $tree = Tree::Object::Hash->new(attr1 => ..., attr2 => ...);


=head1 DESCRIPTION

This is a pretty generic hash-based tree object you can use directly or as a
base class.

It gets its methods from L<Role::TinyCommons::Tree::Node> and
L<Role::TinyCommons::Tree::NodeMethods> roles.

Parent node is stored internally in the C<_parent> key. Children nodes in the
C<_children> key (arrayref). You can store attributes in other keys.


=head1 METHODS

See L<Role::TinyCommons::Tree::Node>, L<Role::TinyCommons::Tree::NodeMethods>
for the complete list of methods.

=head2 CLASS->new(%attrs) => obj

Constructor.

=head2 $obj->parent( [ $obj ] ) => obj

Get or set parent.

=head2 $obj->children( [ \@children ] ) => arrayref

Get or set children.


=head1 SEE ALSO

L<Role::TinyCommons::Tree::Node>

L<Role::TinyCommons::Tree::NodeMethods>
