Step 2.2: Named and factory constructor
=======================================

**Estimated time**: 1 day

[Dart] is quite flexible, ergonomic and feature-rich, when it comes to [constructors][1].

For better understanding [constructors][1] in [Dart], read through the following articles:
- [Dart Docs: Constructors][1]
- [Shaiq Khan: Exploring Dart Constructors][2]




## Named constructor

[Named constructor][11] is a widely adopted idiom in [Dart], providing the following benefits for a codebase:
1. **Clarity**: giving a descriptive name to a constructor, makes it easier for other developers to understand its purpose and use-case.
2. **Encapsulation**: restricting access to certain parts of object's initialization, helps to ensure that rhe object is created in a valid and consistent state.
3. **Code reuse**: factoring out common initialization logic.

A good and illustrative example would be the [`Image`] widget from the [Flutter] framework, with its separate constructors:
```dart
/// A widget that displays an image.
class Image extends StatefulWidget {
  /// Creates a widget that displays an image.
  const Image({
    required this.image,
    // ...
  });

  /// Creates a widget that displays an [ImageStream] obtained from the network.
  Image.network(
    String src, {
    // ...
  }) : image = NetworkImage(src);

  /// Creates a widget that displays an [ImageStream] obtained from a [File].
  Image.file(
    File file, {
    // ...
  }) : image = FileImage(file);

  /// Creates a widget that displays an [ImageStream] obtained from an asset bundle.
  Image.asset(
    String name, {
    // ...
  }) : image = AssetImage(name);

  /// Creates a widget that displays an [ImageStream] obtained from a [Uint8List].
  Image.memory(
    Uint8List bytes, {
    // ...
  }) : image = MemoryImage(bytes);

  /// The image to display.
  final ImageProvider image;
}
```

For better familiarity with [named constructors][11], read through the following articles:
- [Dart Docs: Constructors: Named constructors][11]
- [Dart Tutorial: Named Constructor in Dart][12]




## Factory constructor

> Use the `factory` keyword when implementing a constructor that doesn’t always create a new instance of its class.

[Factory constructor][21] is similar to the [named constructor][11], except:
1. **Control over object creation**: allows to have a complete control over how an object is created, including whether to create a new one, or just take it from some [pool of objects][22] (for example, a [cache][23]).
2. **Returning subtypes**: returns a [subtype][24] of the class being constructed, allowing to create different types of objects, depending on input parameters.

> In the following example, the `Logger` factory constructor returns objects from a cache, and the `Logger.fromJson` factory constructor initializes a final variable from a JSON object.
> ```dart
> class Logger {
>   final String name;
>   bool mute = false;
>
>   // _cache is library-private, thanks to
>   // the _ in front of its name.
>   static final Map<String, Logger> _cache = <String, Logger>{};
>
>   factory Logger(String name) {
>     return _cache.putIfAbsent(name, () => Logger._internal(name));
>   }
>
>   factory Logger.fromJson(Map<String, Object> json) {
>     return Logger(json['name'].toString());
>   }
>
>   Logger._internal(this.name);
>
>   void log(String msg) {
>     if (!mute) print(msg);
>   }
> }
> ```

For better familiarity with [factory constructors][21], read through the following articles:
- [Dart Docs: Constructors: Factory constructors][21]
- [Dart Tutorial: Factory Constructor in Dart][27]
- [Saravanan M: Factory Constructor in Dart — Part 1][25]
- [Saravanan M: Named Constructor vs Factory Constructor in Dart][26]




## Task

Implement a `ChatItemQuote.from` [factory constructor][21] in the [code of this step](task.dart).




## Questions

After completing everything above, you should be able to answer (and understand why) the following questions:
- What are benefits of using named constructors? When should I use them?
- What are benefits of using factory constructors? When should I use them?
- How do both differ?




[`Image`]: https://api.flutter.dev/flutter/widgets/Image-class.html
[Dart]: https://dart.dev
[Flutter]: https://flutter.dev

[1]: https://dart.dev/language/constructors
[2]: https://medium.flutterdevs.com/exploring-dart-constructors-345398a0e4c5
[11]: https://dart.dev/language/constructors#named-constructors
[12]: https://dart-tutorial.com/object-oriented-programming/named-constructor-in-dart
[21]: https://dart.dev/language/constructors#factory-constructors
[22]: https://en.wikipedia.org/wiki/Object_pool_pattern
[23]: https://en.wikipedia.org/wiki/Cache_(computing)
[24]: https://en.wikipedia.org/wiki/Subtyping
[25]: https://medium.com/nerd-for-tech/factory-constructor-in-dart-part-1-1bbdf0d0f7f0
[26]: https://medium.com/nerd-for-tech/named-constructor-vs-factory-constructor-in-dart-ba28250b2747
[27]: https://dart-tutorial.com/object-oriented-programming/factory-constructor-in-dart
