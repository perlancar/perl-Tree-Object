package Tree::Object;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

use Role::Tiny::With;

with 'Role::TinyCommons::Tree::NodeMethods';

sub new {
    my $class = shift;
    my %attrs = @_;
    $attrs{parent} //= undef;
    $attrs{children} //= [];
    bless \%attrs, $class;
}

sub parent {
    my $self = shift;
    if (@_) {
        $self->{parent} = $_[0];
    }
    $self->{parent};
}

sub children {
    my $self = shift;

    if (@_) {
        if (@_ == 1 && ref($_[0]) eq 'ARRAY') {
            $self->{children} = $_[0];
        } else {
            $self->{children} = \@_;
        }
    }
    return @{ $self->{children} };
}

1;
# ABSTRACT: A tree object

=head1 SYNOPSIS

 use Tree::Object;

 my $tree = Tree::Object->new(foo => 1, bar => 2, ...);

 my $child1 = Tree::Object->new( ... );
 my $child2 = Tree::Object->new( ... );

 # connect children to parent
 $child1->parent($tree);
 $child2->parent($tree);

 # connect parent to children
 $tree->children($child1, $child2);


=head1 DESCRIPTION

This is a pretty generic tree object you can use directly or as a base class.

It gets its methods from L<Role::TinyCommons::Tree::Node> and
L<Role::TinyCommons::Tree::NodeMethods> roles.


=head1 METHODS

See L<Role::TinyCommons::Tree::Node>, L<Role::TinyCommons::Tree::NodeMethods>
for the complete list of methods.

=head2 CLASS->new(%attrs) => obj

Constructor.

=head2 $obj->parent( [ $obj ] ) => obj

Get or set parent.

=head2 $obj->children( [ $child, ... ] ) => list

Get or set children.


=head1 SEE ALSO

L<Role::TinyCommons::Tree::Node>

L<Role::TinyCommons::Tree::NodeMethods>
