Dart/Flutter Incubator
======================

This template represents a step-by-step [Dart]/[Flutter] learning course, covering fundamental concepts and many common practical idioms, required for advanced cross-platform [UI] application development.




## Prerequisites


### Toolchain

- [Flutter SDK] for building and running [Flutter] applications. 
- [Dart SDK] for running [Dart] (usually comes bundled with [Flutter SDK], though may be installed separately).
- [VS Code] + [Flutter Extension] or [Android Studio]/[IntelliJ IDEA] + [Flutter plugin] as your IDE (or any other on your choice).


### Intro for emigrants from other languages

- [Flutter for Android developers].
- [Intro to Dart for Java Developers] codelab.
- [Flutter for SwiftUI Developers].
- [Flutter for UIKit developers].
- [Flutter for React Native developers].
- [Flutter for web developers].
- [Flutter for Xamarin.Forms developers].


### Bookshelf

- [Dart API documentation] and [Flutter API documentation].
- [Effective Dart] describing common [Dart] code style and guidelines.
- [Flutter Cookbook] demonstrates how to solve common [Flutter] problems.
- [Dart Cheatsheet] for quick reference.
- [Books about Dart] and [Books about Flutter] lists.
- Official [Flutter YouTube channel], covering many [Flutter] and [Dart] concepts as well as their short [Flutter Widget of the Week] and [Flutter Package of the Week] regular explanatory videos.
- [pub.dev] contains all the official and community made [Flutter] and [Dart] packages, gradually extending the codebase.
- [Flutter Gems] is a list of useful [Dart] and [Flutter] packages, categorized basing on functionality.
- [Awesome Flutter] is a curated list of [Flutter] code and resources.
- [dartpad] allows to explore and run [Dart] and [Flutter] code right in your browser.




## Steps


### Before you start

1. [Create][1] a new [GitHub repository] for yourself using this one [as template][11].
2. [Invite as a collaborator][12] of your repository the person you want to review your steps (mentor or lead).

> **NOTE**: **This learning course is constantly improving and evolving over time.** 
>
> To be up-to-date with the recent changes in your own copy of this repository, attach the upstream history with the following commands:
> ```bash
> git remote add upstream https://github.com/team113/flutter-incubator.git
> git fetch upstream main
> git merge upstream/main --allow-unrelated-histories
> ```
> And then, whenever you want to grab some new changes, do the following:
> ```bash
> git fetch upstream main
> git merge upstream/main
> ```
> Additionally, to be aware about new changes, you may either [watch this repository on GitHub][2], or even track it via [RSS subscription].


### Schedule

Each step must be performed as a separate [PR (pull request)][PR] with the appropriate name, and checkmarked here, in README's schedule, after its completion. Consider to use `dart format`/`flutter format` and `dart analyze`/`flutter analyze` when you're writing [Dart] code.

Each step has the estimated time for completion. If any deeper investigation on step's theme is needed by you, then it's on your own.

Do not hesitate to ask your mentor/lead with questions, however you won't receive any concrete answer, but rather a direction for your own investigation. _Mentor/Lead is the one who asks questions here, demanding concrete and complete answers._

- [ ] [0. Become familiar with Dart basics][Step 0] (1 day)
- [ ] [1. Dart concepts][Step 1] (1 day)
    - [ ] [1.1. Mixins and extensions][Step 1.1] (1 day)
    - [ ] [1.2. Async and isolates][Step 1.2] (1 day)
    - [ ] [1.3. Generics][Step 1.3] (1 day)
    - [ ] [1.4. Conditional compilation][Step 1.4] (1 day)
- [ ] [2. Dart idioms][Step 2] (1 day)
    - [ ] [2.1. Rich types ensure correctness][Step 2.1] (1 day)
    - [ ] [2.2. Named and factory constructor][Step 2.2] (1 day)
    - 2.3. SOLID
- [ ] [3. Dart ecosystem][Step 3] (1 day)
    - [ ] [3.1. Serialization and deserialization][Step 3.1] (1 day)
    - [ ] [3.6. Code generation][Step 3.6] (1 day)




## Credits

Inspired by [Rust Incubator].




[Step 0]: 0_dart_basics
[Step 1]: 1_dart_concepts
[Step 1.1]: 1_dart_concepts/1_1_mixins
[Step 1.2]: 1_dart_concepts/1_2_async
[Step 1.3]: 1_dart_concepts/1_3_generics
[Step 1.4]: 1_dart_concepts/1_4_conditional_compilation
[Step 2]: 2_dart_idioms
[Step 2.1]: 2_dart_idioms/2_1_type_safety
[Step 2.2]: 2_dart_idioms/2_2_factory
[Step 3]: 3_dart_ecosystem
[Step 3.1]: 3_dart_ecosystem/3_1_serialization
[Step 3.6]: 3_dart_ecosystem/3_6_codegen

[Android Studio]: https://developer.android.com/studio
[Awesome Flutter]: https://github.com/Solido/awesome-flutter
[Books about Dart]: https://dart.dev/resources/books
[Books about Flutter]: https://docs.flutter.dev/resources/books
[Dart]: https://dart.dev
[Dart API documentation]: https://api.dart.dev
[Dart Cheatsheet]: https://dart.dev/codelabs/dart-cheatsheet
[Dart SDK]: https://dart.dev/get-dart
[dartpad]: https://dartpad.dev
[Effective Dart]: https://dart.dev/guides/language/effective-dart
[Flutter]: https://flutter.dev
[Flutter API documentation]: https://api.flutter.dev
[Flutter Cookbook]: https://docs.flutter.dev/cookbook
[Flutter Extension]: https://marketplace.visualstudio.com/items?itemName=Dart-Code.flutter
[Flutter for Android developers]: https://docs.flutter.dev/get-started/flutter-for/android-devs
[Flutter for React Native developers]: https://docs.flutter.dev/get-started/flutter-for/react-native-devs
[Flutter for SwiftUI Developers]: https://docs.flutter.dev/get-started/flutter-for/swiftui-devs
[Flutter for UIKit developers]: https://docs.flutter.dev/get-started/flutter-for/uikit-devs
[Flutter for Xamarin.Forms developers]: https://docs.flutter.dev/get-started/flutter-for/xamarin-forms-devs
[Flutter for web developers]: https://docs.flutter.dev/get-started/flutter-for/web-devs
[Flutter Gems]: https://fluttergems.dev
[Flutter Package of the Week]: https://www.youtube.com/playlist?list=PLjxrf2q8roU1quF6ny8oFHJ2gBdrYN_AK
[Flutter plugin]: https://plugins.jetbrains.com/plugin/9212-flutter
[Flutter SDK]: https://docs.flutter.dev/get-started/install
[Flutter Widget of the Week]: https://www.youtube.com/playlist?list=PLjxrf2q8roU23XGwz3Km7sQZFTdB996iG
[Flutter YouTube channel]: https://www.youtube.com/@flutterdev
[GitHub repository]: https://help.github.com/articles/github-glossary#repository
[IntelliJ IDEA]: https://www.jetbrains.com/idea/download
[Intro to Dart for Java Developers]: https://developers.google.com/codelabs/from-java-to-dart
[PR]: https://help.github.com/articles/github-glossary#pull-request
[RSS subscription]: https://github.com/team113/flutter-incubator/commits/main.atom
[Rust Incubator]: https://github.com/instrumentisto/rust-incubator
[pub.dev]: https://pub.dev
[UI]: https://en.wikipedia.org/wiki/User_interface
[VS Code]: https://code.visualstudio.com

[1]: https://github.com/team113/flutter-incubator/generate
[2]: https://github.com/team113/flutter-incubator/subscription
[11]: https://help.github.com/en/articles/creating-a-repository-from-a-template
[12]: https://help.github.com/en/articles/inviting-collaborators-to-a-personal-repository
