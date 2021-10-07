package Tree::Object::Array;

use 5.010001;
use strict;
use warnings;

# AUTHORITY
# DATE
# DIST
# VERSION

sub import {
    my ($class0, @attrs) = @_;

    my $caller = caller();

    my $code_str = "package $caller;\n";

    $code_str .= "use Class::Accessor::Array {\n";
    $code_str .= "    accessors => {\n";
    my $idx = 0;
    for (@attrs, "parent", "children") {
        $code_str .= "        '$_' => $idx,\n";
        $idx++;
    }
    $code_str .= "    },\n";
    $code_str .= "};\n";

    $code_str .= "use Role::Tiny::With;\n";
    $code_str .= "with 'Role::TinyCommons::Tree::NodeMethods';\n";

    #say $code_str;

    eval $code_str;
    die if $@;
}

1;
# ABSTRACT: An array-based tree object

=head1 SYNOPSIS

In F<lib/My/ArrayTree.pm>:

 package My::ArrayTree;
 use Tree::Object::Array qw(attr1 attr2 attr3);
 1;


=head1 DESCRIPTION

This module lets you create an array-backed (instead of hash-backed) tree
object. Instead of subclassing C<Tree::Object::Hash>, you C<use> it in your
class and listing all the attributes you will need. It uses
L<Class::Accessor::Array> to store data:

 [$attr1, $attr2, ..., $parent, \@children]


=head1 SEE ALSO

L<Tree::Object::Array::Glob>, a variant which stores the children nodes directly
as the last elements of the array to avoid creating an extra subarray.
