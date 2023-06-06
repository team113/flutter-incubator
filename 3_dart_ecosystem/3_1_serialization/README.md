Step 3.1: Serialization and deserialization
===========================================

**Estimated time**: 1 day




## `dart:convert`

The core and heart of [serialization][11] in [Dart] is represented by the [`dart:convert`] library. It provides the base abstractions and implementations for most often used formats (like [JSON] or [Base64]).

```dart
import 'dart:convert';

void main() {
  final Map<String, dynamic> map = {
    'string': 'value',
    'date': DateTime(0).toString(),
    'integer': 0,
    'double': 0.0,
  };

  final String encoded = json.encode(map);

  // {"string":"value","date":"0000-01-01 00:00:00.000","integer":0,"double":0.0}
  print(encoded);

  final Map<String, dynamic> decoded = json.decode(encoded);

  // {string: value, date: 0000-01-01 00:00:00.000, integer: 0, double: 0.0}
  print(decoded);
}
```
It's also considered a good practice (and convention) to provide `fromJson` and `toJson` methods (naming could be adapted, of course, if the desired format is not [JSON]), defined in the classes going to be serialized/deserialized:
```dart
class Person {
  const Person({
    required this.name,
    required this.birthday,
  });

  Person.fromJson(Map<String, String> map)
      : name = map['name']!,
        birthday = DateTime.parse(map['birthday']!);

  Map<String, String> toJson(Map<dynamic, String> map) => {
    'name': name,
    'birthday': birthday.toString(),
  };

  final String name;
  final DateTime birthday;
}
```

For the formats not being provided by the [`dart:convert`] library, or if a custom implementation is preferred, it's enough to implement (or provide) the desired [`Codec`] implementation (like [`XmlNodeCodec`] for [XML] format, for example).

For more familiarity with [`dart:convert`] library abstractions and usage, read through the following articles:
- [Official `dart:convert` library docs][`dart:convert`]




## Code generation

Implementing `fromJson` and `toJson` methods (or similar ones) manually may be quite a burden, especially for large codebases, polluting the codebase with too much [boilerplate code][21]. [`json_serializable`] and [`built_value`] packages (and similar ones) make this much easier, by generating all the serialization [boilerplate code][21] for you.

> Given a library `example.dart` with an `Person` class annotated with [`JsonSerializable`]:
> ```dart
> import 'package:json_annotation/json_annotation.dart';
>
> part 'example.g.dart';
>
> @JsonSerializable()
> class Person {
>   /// The generated code assumes these values exist in JSON.
>   final String firstName, lastName;
>
>   /// The generated code below handles if the corresponding JSON value doesn't
>   /// exist or is empty.
>   final DateTime? dateOfBirth;
>
>   Person({required this.firstName, required this.lastName, this.dateOfBirth});
>
>   /// Connect the generated [_$PersonFromJson] function to the `fromJson`
>   /// factory.
>   factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);
>
>   /// Connect the generated [_$PersonToJson] function to the `toJson` method.
>   Map<String, dynamic> toJson() => _$PersonToJson(this);
> }
> ```
> Building creates the corresponding part example.g.dart:
> ```dart
> part of 'example.dart';
>
> Person _$PersonFromJson(Map<String, dynamic> json) => Person(
>       firstName: json['firstName'] as String,
>       lastName: json['lastName'] as String,
>       dateOfBirth: json['dateOfBirth'] == null
>           ? null
>           : DateTime.parse(json['dateOfBirth'] as String),
> );
>
> Map<String, dynamic> _$PersonToJson(Person instance) => <String, dynamic>{
>       'firstName': instance.firstName,
>       'lastName': instance.lastName,
>       'dateOfBirth': instance.dateOfBirth?.toIso8601String(),
>     };
> ```

For more information about [code generation][20] capabilities for [serialization][11], its design and features, read through the following articles:
- [Official `json_serializable` package docs][`json_serializable`]
- [Official `built_value` package docs][`built_value`]
- [Flutter Docs: JSON and serialization][22]
- [Enrico Ori: Starting with Flutter: JSON & Serialization][23]
- [Aloïs Deniel: JSON serialization in Dart strong mode][24]




## Task

Write a program which deserializes the [following JSON](request.json) into a `Request` class and prints out its serialization in [YAML] and [TOML] formats. Consider to choose correct and accurate types for data representation.




## Questions

After completing everything above, you should be able to answer (and understand why) the following questions:
- What is serialization? Why is it used? What problems does it solve?
- How serialization is represented in [Dart]? Describe and explain core abstractions.
- What are good practices when implementing a serializable type? Why?
- How code generation can help with serialization? When is it better to use it? When not?




[`built_value`]: https://pub.dev/documentation/built_value
[`Codec`]: https://api.dart.dev/stable/dart-convert/Codec-class.html
[`dart:convert`]: https://api.dart.dev/stable/dart-convert/dart-convert-library.html
[`json_serializable`]: https://pub.dev/documentation/json_serializable
[`JsonSerializable`]: https://pub.dev/documentation/json_annotation/latest/json_annotation/JsonSerializable-class.html
[`XmlNodeCodec`]: https://pub.dev/documentation/xml/latest/xml_events/XmlNodeCodec-class.html
[Base64]: https://en.wikipedia.org/wiki/Base64
[Dart]: https://dart.dev
[JSON]: https://en.wikipedia.org/wiki/JSON
[TOML]: https://en.wikipedia.org/wiki/TOML
[XML]: https://en.wikipedia.org/wiki/XML
[YAML]: https://en.wikipedia.org/wiki/YAML

[11]: https://en.wikipedia.org/wiki/Serialization
[20]: https://en.wikipedia.org/wiki/Automatic_programming
[21]: https://en.wikipedia.org/wiki/Boilerplate_code
[22]: https://docs.flutter.dev/data-and-backend/json
[23]: https://medium.com/theotherdev-s/starting-with-flutter-json-serialization-af285ec93e99
[24]: https://aloisdeniel.github.io/flutter-json-serialization
