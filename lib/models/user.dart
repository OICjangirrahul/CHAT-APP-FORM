import 'dart:io';

class Person {
  Future? imageFilee;
  // Named Private Constructor
  Person._() {}
  //static Person? person = null;
  static Person? person = Person._(); // Eager Singleton
  // static Person? getInstance() {
  // Lazy Singleton
  //   // if (person == null) {
  //   //   person = Person._();
  //   // }
  //   return person;
  // }
  static final getInstance = () => person;
}
