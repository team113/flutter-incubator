Step 1.1: Mixins and extensions
===============================

**Estimated time**: 1 day




## Extensions

[Extension methods][11] is a vital concept in [Dart], allowing to add functionality to existing types in foreign libraries.

> For example, here’s how you might implement an extension on the `String` class:
> ```dart
> extension NumberParsing on String {
>   int parseInt() {
>     return int.parse(this);
>   }
>
>   double parseDouble() {
>     return double.parse(this);
>   }
> }
> ```

> ```dart
> print('42'.parseInt());
> ```

For better understanding of [extensions][11] design, benefits and use-cases, read through the following articles:
- [Dart Docs: Extension methods][11]
- [Lasse Reichstein Holst Nielsen: Dart Extension Methods Fundamentals][12]
- [Dart Language Spec: Dart Static Extension Methods Design][13]




## Mixins

[Mixins][21] in [Dart] represent a way of defining code that can be reused in multiple class hierarchies.

> ```dart
> mixin Musical {
>   bool canPlayPiano = false;
>   bool canCompose = false;
>   bool canConduct = false;
>
>   void entertainMe() {
>     if (canPlayPiano) {
>       print('Playing piano');
>     } else if (canConduct) {
>       print('Waving hands');
>     } else {
>       print('Humming to self');
>     }
>   }
> }
> ```

> ```dart
> class Maestro extends Person with Musical, Aggressive, Demented {
>   Maestro(String maestroName) {
>     name = maestroName;
>     canConduct = true;
>   }
> }
> ```

For better understanding of [mixins][21] design, benefits and use-cases, read through the following articles:
- [Dart Docs: Mixins][21]
- [Romain Rastel: Dart: What are mixins?][22]




## Task

- [`task_1.dart`](task_1.dart): implement an extension on `DateTime`, returning a `String` in format of `YYYY.MM.DD hh:mm`.
- [`task_2.dart`](task_2.dart): implement an extension on `String`, parsing links from a text.
- [`task_3.dart`](task_3.dart): provide mixins describing equipable `Item`s by a `Character` type, implement the methods equipping them.




## Questions

After completing everything above, you should be able to answer (and understand why) the following questions:
- Why do you need to extend classes? Name some examples.
- Can extension be private? Unnamed? Generic?
- How to resolve naming conflicts when multiple extensions define the same methods?
- What is reasoning behind mixins? Why would you need them? Provide some examples.
- Can you add static methods and/or fields to mixins?
- `class`, `mixin`, or `mixin class`? What are differences? When to use each one?




[Dart]: https://dart.dev

[11]: https://dart.dev/language/extension-methods
[12]: https://medium.com/dartlang/extension-methods-2d466cd8b308
[13]: https://github.com/dart-lang/language/blob/main/accepted/2.7/static-extension-methods/feature-specification.md
[21]: https://dart.dev/language/mixins
[22]: https://medium.com/flutter-community/dart-what-are-mixins-3a72344011f3
