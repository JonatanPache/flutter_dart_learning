/*
Source: https://medium.com/flutter-community/dart-what-are-mixins-3a72344011f3
Both, AB and BA classes extend the P class and apply A and B mixins but in a
different order. Both A, B mixins and the P classes have a method called
getMessage.
Well, can you tell what the output of the following program is 😵?
So, what do you think the resulting output will be?
I’m giving you five propositions:

A. It does not compile
B. BA <--
C. AB
D. BAAB
E. ABBA
 */

mixin A {
  String getMessage() => 'A';
}

mixin B {
  String getMessage() => 'B';
}

class P {
  String getMessage() => 'P';
}

class AB extends P with A, B {}

class BA extends P with B, A {}

void main() {
  String result = '';

  final ab = AB();
  result += ab.getMessage();

  final ba = BA();
  result += ba.getMessage();

  print(result);
}


/*
✨ Linearization
When you apply a mixin to a class, keep in mind this

Mixins in Dart work by creating a new class that layers the implementation of
the mixin on top of a superclass to create a new class — it is not “on the side”
but “on top” of the superclass, so there is no ambiguity in how to resolve
lookups.

New classes are created between AB and P. These new classes are a mix-in
between the superclass P and the mixins A and B.

As you can see, there is no multiple inheritance in there!

'Mixins is not a way to get multiple inheritance in the classical sense. Mixins
is a way to abstract and reuse a family of operations and state. It is similar
to the reuse you get from extending a class, but it is compatible with
single-inheritance because it is linear.'

One important thing to remember is that the order in which mixins are declared
represents the inheritance chain, from the top superclass to the bottom one.
 */