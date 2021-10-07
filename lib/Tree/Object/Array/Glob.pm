package Tree::Object::Array::Glob;

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

    $code_str .= "use Class::Accessor::Array::Glob {\n";
    $code_str .= "    accessors => {\n";
    my $idx = 0;
    for (@attrs, "parent", "children") {
        $code_str .= "        '$_' => $idx,\n";
        $idx++;
    }
    $code_str .= "    },\n";
    $code_str .= "    glob_attribute => 'children',\n";
    $code_str .= "};\n";

    $code_str .= "use Role::Tiny::With;\n";
    $code_str .= "with 'Role::TinyCommons::Tree::NodeMethods';\n";

    #say $code_str;

    eval $code_str;
    die if $@;
}

1;
# ABSTRACT: An array-based tree object (variant)

=head1 SYNOPSIS

In F<lib/My/ArrayTree.pm>:

 package My::ArrayTree;
 use Tree::Object::Array::Glob qw(attr1 attr2 attr3);
 1;


=head1 DESCRIPTION

This module lets you create an array-backed (instead of hash-backed) tree
object. Instead of subclassing C<Tree::Object::Hash>, you C<use> it in your
class and listing all the attributes you will need.

This module is a variation of L<Tree::Object::Array>. It uses
L<Class::Accessor::Array::Glob> instead of L<Class::Accessor::Array>. Instead
of storing data using:

 [$attr1, $attr2, ..., $parent, \@children]

it stores data as:

 [$attr1, $attr2, ..., $parent, @children]

This style of storage avoids creating an extra array for storing the children
and maintain a flat array instead. But one caveat is that your subclass won't be
able to introduce more attributes, because the C<children> attribute is a
"globbing" attribute at the end of the array.


=head1 SEE ALSO

L<Tree::Object::Array>
