Step 2.1: Rich types ensure correctness
=======================================

**Estimated time**: 1 day

[Dart] is a [statically typed][1] language, which means that it check types in a program to be correct at compile-time. This leads to the obvious conclusion: the more compiler knows about our problem - the more false programs it will decline. Or, rephrased: **the more we describe about the program in types - the more we reduce the probability for the program to be incorrect**.




## Explicit types

It is a [good practice to be explicit about types][12] your code uses. [Dart] is quite forgiving when no type is explicitly set: it simply assumes such cases as a [`dynamic` type][11], loosing all the benefits provided by [static typing][1].

For more details, read through the following articles:
- [Effective Dart: AVOID using `dynamic` unless you want to disable static checking][12]
- [Linter for Dart: `always_specify_types`][13]




## Newtype

Consider the following example, which demonstrates a possible bug:
```dart
class AuthService {
  Future<String> signUp(String name, String password) async {
    // The following compiles fine, since types are the same.
    return await backend.signUp(
      name: password,  // Ooops!
      password: name,  // Ooops!
    );
  }
}
```
Here the problem occurs because our entities are expressed in values, so the compiler makes no difference between `name` and `password` as they have the same type.

Let's express those entities in types:
```dart
class UserName {
  const UserName(this.val);
  final String val;
}

class UserPassword {
  const UserPassword(this.val);
  final String val;
}

class Credentials {
  const Credentials(this.val);
  final String val;
}
```

Now, the compiler is able to cut off this type of bugs _totally_ at compile-time:
```dart
class AuthService {
  Future<Credentials> signUp(UserName name, UserPassword password) async {
    return await backend.signUp(
      name: password,  // Does not compile!
      password: name,  // Does not compile!
    );
  }
}
```

This is what is called "[newtype idiom][21]", originated from such languages as [Haskell] and [Rust]. [Newtype][21] is a type with a distinct identity (and so, different meaning and type-checking guarantees), but with the same representation (and, often, behavior) as the existing type it wraps. Additionally, you may **enforce desired invariants on values of the type**, like, for example, if a `UserId` is expected to be always 36 characters long (standard [UUID] length), then this constraint could be ensured right in its constructor:
```dart
class UserId {
  UserId(this.val) {
    if (val.length != 36) {
      throw const FormatException('Must be 36 characters long');
    }
  }

  final String val;
}
```

Also, [newtype idiom][21] **makes code more understandable for developers**, as domain knowledge is reflected in types, so is described and documented more explicitly.

The downside of using [newtype idiom][21], however, is a necessity of writing **more [boilerplate code][25]**.

For better understanding [newtype idiom][21], read through the following articles:
- [dart-lang/language#2132: The `newtype` idiom][21]
- [Rust Design Patterns: Newtype][24]
- [Alexis King: Parse, don’t validate][22] ([ru][23])




## Task

For the [code in this step](task.dart), do the following:
- fix missing explicit types;
- decompose the types using the [newtype idiom][21];
- add documentation following the "[Effective Dart: Documentation]" guidelines.




## Questions

After completing everything above, you should be able to answer (and understand why) the following questions:
- Why should you be explicit about types in [Dart]?
- What is a [newtype idiom][21] and why is it useful?




[Dart]: https://dart.dev
[Effective Dart: Documentation]: https://dart.dev/guides/language/effective-dart/documentation
[Haskell]: https://www.haskell.org
[Rust]: https://www.rust-lang.org
[UUID]: https://en.wikipedia.org/wiki/Universally_unique_identifier

[1]: https://en.wikipedia.org/wiki/Type_system#STATIC
[11]: https://www.educative.io/answers/what-is-a-dynamic-type-in-dart
[12]: https://dart.dev/effective-dart/design#avoid-using-dynamic-unless-you-want-to-disable-static-checking
[13]: https://dart-lang.github.io/linter/lints/always_specify_types.html
[21]: https://github.com/dart-lang/language/issues/2132
[22]: https://lexi-lambda.github.io/blog/2019/11/05/parse-don-t-validate
[23]: https://habr.com/ru/post/498042
[24]: https://rust-unofficial.github.io/patterns/patterns/behavioural/newtype.html
[25]: https://en.wikipedia.org/wiki/Boilerplate_code
