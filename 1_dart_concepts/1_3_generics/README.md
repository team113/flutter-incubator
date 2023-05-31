Step 1.3: Generics
==================

**Estimated time**: 1 day

[Generics][1] represent the main form of [parametric polymorphism][2] in [Dart], allowing a single piece of code to be given a "generic" type, using variables in place of actual types, and then instantiated with particular types as needed.

> Generic types can save you the trouble of creating all these interfaces. Instead, you can create a single interface that takes a type parameter:
> ```dart
> abstract class Cache<T> {
>   T getByKey(String key);
>   void setByKey(String key, T value);
> }
> ```
> In this code, `T` is the stand-in type. It’s a placeholder that you can think of as a type that a developer will define later.

For better understanding of [generics][3] design in [Dart], their benefits and use-cases, read through the following articles:
- [Dart Docs: Generics][3]
- [Dart Tutorial: Dart Generics][4]
- [Monty Rasmussen: Generics in Dart and Flutter][5]
- [Shaiq Khan: Explore Generics In Dart & Flutter][6]




## Task

Implement a method, returning the maximum element from a `Comparable` list. You must use [generics][3] to allow different types usage with that method.




## Questions

After completing everything above, you should be able to answer (and understand why) the following questions:
- What are generics in [Dart]? Why are they useful?
- What is a type parameter? How can a type parameter be constrained?




[Dart]: https://dart.dev

[1]: https://en.wikipedia.org/wiki/Generic_programming
[2]: https://en.wikipedia.org/wiki/Parametric_polymorphism
[3]: https://dart.dev/language/generics
[4]: https://www.darttutorial.org/dart-tutorial/dart-generics
[5]: https://dart.academy/generics-in-dart-and-flutter
[6]: https://medium.flutterdevs.com/explore-generics-in-dart-flutter-6dd62b6f3ed4
