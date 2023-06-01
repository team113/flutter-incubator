Step 3.6: Code generation
=========================

**Estimated time**: 1 day

[Code generation][10] is a widely used solution to the [boilerplate code][11] problem in various [Dart] projects, for example:
- [databases][12], like [`hive`], [`isar`] or [`objectbox`];
- [RESTful] API generators, like [`chopper`] or [`retrofit`];
- [GraphQL] API generators, like [`artemis`] or [`graphql_codegen`];
- serializers, like [`json_serializable`] or [`built_value`].




## Builder

[Code generation][10] in [Dart] is essentially creating a [visitor][21], visiting each file configured by the [`build`] package, by implementing the [`Builder`] class:
```dart
class MyBuilder extends Builder {
  // [buildExtensions] define the file extensions to be visited, 
  // and, optionally, the output files going to be produced. 
  @override
  Map<String, List<String>> get buildExtensions => {
    '.dart': [],
  };
  
  // This method is invoked on each file that meets the extensions 
  // provided in the [buildExtensions].
  @override
  FutureOr<void> build(BuildStep buildStep) {
    // Implement builder.
  }
}
```

To register the [`Builder`] in the [`build_runner`], create a function returning it:
```dart
Builder myBuilder(BuilderOptions options) {
  // [BuilderOptions] may be used to configure your [Builder] implementation.
  return MyBuilder();
}
```
And add the [`Builder`] to the `build.yaml` file of the project, which customizes the build behavior of a package (see the [`build_config`] package for more information).
```yaml
builders:
  my_builder:
    import: "package:my_package/my_package.dart"
    builder_factories: ["myBuilder"]
    build_extensions: {".dart": []}
    auto_apply: dependents
    build_to: source
```

Adding the package, a [`Builder`] is implemented in, as a [dependency][22] allows to run the [`build_runner`] and invoke it:
```bash
dart run build_runner build
```

[`source_gen`] package provides useful utilities for automated [Dart] source code generation:
> - A **framework** for writing Builders that consume and produce Dart code.
> - A **convention** for human and tool generated Dart code to coexist with clean separation, and for multiple code generators to integrate in the same project.
>
> Its main purpose is to expose a developer-friendly API on top of lower-level packages like the [analyzer][`analyzer`] or [build][`build`]. You don't _have_ to use `source_gen` in order to generate source code; we also expose a set of library APIs that might be useful in your generators.

[`analyzer`] package allows to perform a [static analysis][23] of [Dart] code.

For more familiarity with these tools, read through the following articles:
- [Dart Tools: `build_runner`][24]
- [Official `build` package docs][`build`]
- [Official `build_runner` package docs][`build_runner`]
- [Official `analyzer` package docs][`analyzer`]
- [Official `source_gen` package docs][`source_gen`]




## Annotations

When implementing a [code generator][10], it may be unclear to which definitions in a source file the end users want to apply it exactly. This is where custom [annotations][31] come into play. We just define a custom [annotation][31]:
```dart
class MyAnnotation {
  const MyAnnotation(this.argument);
  final int argument;
}
```
And force end users to explicitly mark the definitions with it:
```dart
@MyAnnotation(0)
class EndUserClass {}
```

The job becomes even easier, because the [`source_gen`] package allows us to extend the [`GeneratorForAnnotation`] class, and so, to work directly with the [annotated][31] declarations only, skipping anything else.




## Conventions

The following conventions are considered as good practices of [code generation][10] in [Dart] ecosystem:
- **Generated source code files should have a `.g.dart` extension** (except when using [`freezed`]), so they may be easily omitted by tools.
- **Exclude the generated files in the `analysis_options.yaml`** file, since they are not written manually - there is no sense to lint them.
- **Commit the generated files to [VCS]**, so the code navigation in [IDE]s/browsers is possible without extra steps.
- **Never manually edit the generated files**, but rather regenerate them.




## More reading

For more information and insights about [code generation][10] in [Dart], read through the following articles:
- [Flutter Handbook: Code generation][41]




## Task

- `task_1`: create a [Dart] package (`dart create -t package task_1`) with a [`Builder`] generating a `summary.g` file in the root of the package using this builder, with the following information:
  ```
  Total lines of code: 1000

  Lines of code by a file in descending order:
  1. `dummy.dart`: 800
  2. `test.dart`: 180
  3. `main.dart`: 20
  ```

- `task_2`: create a [Dart] package (`dart create -t package task_2`) with a [`Generator`] generating `toJson` and `fromJson` functions on the annotated classes. No need to dive deep with types, for example:
  ```dart
  // person.dart
  part 'person.my.dart';

  class Person {
    const Person({required this.name, required this.birthday});
    final String name;
    final DateTime birthday;

    factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);
    Map<String, dynamic> toJson() => _$PersonToJson(this);
  }
  ```
  ```dart
  // person.my.dart (generated)
  // GENERATED CODE - DO NOT MODIFY BY HAND

  // **************************************************************************
  // SerializationGenerator
  // **************************************************************************

  part of 'person.dart';

  Person _$PersonFromJson(Map<String, dynamic> json) => Person(
      name: json['name'] as String,
      birthday: json['birthday'] == null
          ? null
          : DateTime.parse(json['birthday'] as String),
    );

  Map<String, dynamic> _$PersonToJson(Person instance) => {
      'name': instance.name,
      'birthday': instance.birthday?.toString(),
    };
  ```




## Questions

After completing everything above, you should be able to answer (and understand why) the following questions:
- What is code generation? Which problems does it solve and how?
- How code generations is represented in [Dart]?
- How [`Builder`]s are registered and used in a [Dart] project?
- What is the purpose of [`analyzer`] and [`source_gen`] packages? Why do we need them for code generation in [Dart]?
- What are annotations in [Dart]? How are custom annotations created? How they can be used and why?
- Which are good practices of code generation in [Dart] ecosystem?




[`analyzer`]: https://pub.dev/documentation/analyzer
[`artemis`]: https://pub.dev/packages/artemis
[`build`]: https://pub.dev/documentation/build
[`build_config`]: https://pub.dev/documentation/build_config
[`build_runner`]: https://pub.dev/documentation/build_runner
[`Builder`]: https://pub.dev/documentation/build/latest/build/Builder-class.html
[`built_value`]: https://pub.dev/documentation/built_value
[`chopper`]: https://pub.dev/documentation/chopper
[`freezed`]: https://pub.dev/documentation/freezed
[`Generator`]: https://pub.dev/documentation/source_gen/latest/source_gen/Generator-class.html
[`GeneratorForAnnotation`]: https://pub.dev/documentation/source_gen/latest/source_gen/GeneratorForAnnotation-class.html
[`graphql_codegen`]: https://pub.dev/documentation/graphql_codegen
[`hive`]: https://pub.dev/documentation/hive
[`isar`]: https://pub.dev/documentation/isar
[`json_serializable`]: https://pub.dev/documentation/json_serializable
[`objectbox`]: https://pub.dev/documentation/objectbox
[`retrofit`]: https://pub.dev/documentation/retrofit
[`source_gen`]: https://pub.dev/documentation/source_gen
[Dart]: https://dart.dev
[GraphQL]: https://graphql.com
[IDE]: https://en.wikipedia.org/wiki/Integrated_development_environment
[RESTful]: https://en.wikipedia.org/wiki/Representational_state_transfer
[VCS]: https://en.wikipedia.org/wiki/Version_control

[10]: https://en.wikipedia.org/wiki/Automatic_programming
[11]: https://en.wikipedia.org/wiki/Boilerplate_code
[12]: https://en.wikipedia.org/wiki/Database
[21]: https://en.wikipedia.org/wiki/Visitor_pattern
[22]: https://dart.dev/tools/pub/dependencies
[23]: https://en.wikipedia.org/wiki/Static_program_analysis
[24]: https://dart.dev/tools/build_runner
[31]: https://dart.dev/language/metadata
[41]: https://infinum.com/handbook/flutter/basics/code-generation
