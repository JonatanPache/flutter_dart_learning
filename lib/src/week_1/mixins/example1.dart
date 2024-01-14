abstract class Animal {}

abstract class Mammal extends Animal {}

abstract class Bird extends Animal {}

abstract class Fish extends Animal {}

// version old, not working
// abstract class Fly {
//   void fly() => print('Im flying');
// }

// abstract class Walk {
//   void walk() => print('Im flying');
// }

// abstract class Swim {
//   void swim() => print('Im flying');
// }

mixin Fly {
  void fly() => print('Im flying');
}

mixin Walk {
  void walk() => print('Im walking');
}

mixin Swim {
  void swim() => print('Im swimming');
}

class Delfin extends Fish with Swim{}
class Murcielago extends Mammal with Walk, Fly{}
class Cat extends Mammal with Walk{}


void main(){
  // final because not change for future
  final delfin = Delfin();
  delfin.swim();

  final murcielago = Murcielago();
  murcielago.walk();
  murcielago.fly();

}
