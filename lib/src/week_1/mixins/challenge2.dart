/*
Types
What is the type of a mixin application instance? In general, it is a **subtype
of its superclass**, and also a subtype of the type denoted by the mixin name
itself, that is, the type of the original class.
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
  AB ab = AB();
  print(ab is P);
  print(ab is A);
  print(ab is B);

  // BA ba = BA();
  // print(ba is P);
  // print(ba is A);
  // print(ba is B);
}

/*
Explication Details
Since each mixin application creates a new class, it also creates a new
interface (because all Dart classes also define interfaces). As described,
the new class extends the superclass and includes copies of the mixin class
members, but it also implements the mixin class interface.

In most cases, there is no way to refer to that mixin-application class or
its interface; the class for Super with Mixin is just an anonymous superclass
of the class declared like class C extends Super with Mixin {}. If you name
a mixin application like class CSuper = Super with Mixin {}, then you can refer
to the mixin application class and its interface, and it will be a sub-type of
both Super and Mixin.
 */