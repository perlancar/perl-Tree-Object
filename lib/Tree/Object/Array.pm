package Tree::Object::Array;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

sub import {
    my ($class0, @attrs) = @_;

    my $caller = caller();

    my $code_str = "package $caller;\n";
    $code_str .= "use Class::Build::Array::Glob;\n";
    $code_str .= "use Role::Tiny::With;\n";
    for (@attrs) {
        $code_str .= "has $_ => (is=>'rw');\n";
    }
    $code_str .= "has parent => (is=>'rw');\n";
    $code_str .= "has children => (is=>'rw', glob=>1);\n";
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
class and listing all the attributes you will need. One caveat: Your subclasses
won't be able to introduce more attributes. The reason is that the object will
be an array:

 [$attr1, $attr2, $attr3, $parent, @children]

After your specified attributes, the array will be used to store the parent node
and zero or more children nodes. So there is no more space at the end to store
other attributes.
