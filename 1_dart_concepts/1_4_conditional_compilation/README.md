Step 1.4: Conditional compilation
=================================

**Estimated time**: 1 day

> Dart’s compiler technology lets you run code in different ways:
> - **Native platform**: For apps targeting mobile and desktop devices, Dart includes both a Dart VM with just-in-time (JIT) compilation and an ahead-of-time (AOT) compiler for producing machine code.
> - **Web platform**: For apps targeting the web, Dart can compile for development or production purposes. Its web compiler translates Dart into JavaScript.

When compiling [Dart] to web or natively, the following must be accounted:
1. Some libraries are unavailable when running either in browser or natively.  
   Examples:
    - [`dart:io`]: direct [I/O] operations are not supported in browser due to its [sandbox restrictions][1];
    - [`dart:html`]/[`dart:js`]: native platforms don't work with [HTML] or [JavaScript].
2. Some classes may have additional implementation notes and features.  
   Examples:
    - [`DateTime`] supports [no microseconds in browser][2], because the [`Date`] object in [JavaScript], used under-the-hood when compiling to web, doesn't provide them.

> If your library supports multiple platforms, then you might need to conditionally import or export library files. A common use case is a library that supports both web and native platforms.
>
> To conditionally import or export, you need to check for the presence of `dart:*` libraries. Here’s an example of conditional export code that checks for the presence of `dart:io` and `dart:html`:
> ```dart
> export 'src/hw_none.dart' // Stub implementation
>     if (dart.library.io) 'src/hw_io.dart' // dart:io implementation
>     if (dart.library.html) 'src/hw_html.dart'; // dart:html implementation
> ```
> Here’s what that code does:
> - In an app that can use `dart:io` (for example, a command-line app), export `src/hw_io.dart`.
> - In an app that can use `dart:html` (a web app), export `src/hw_html.dart`.
> - Otherwise, export `src/hw_none.dart`.
>
> To conditionally import a file, use the same code as above, but change `export` to `import`.

The following files layout may be considered for separating code of different platforms:
```
lib/
├── src/
│   ├── interface.dart
│   ├── io.dart
│   └── web.dart
└── package.dart
```

To learn more about conditional compilation in [Dart], read through the following articles:
- [Dart overview][3]
- [Dart Docs: Web platform][4]
- [Dart Guides: Conditionally importing and exporting library files][5]
- [Gonçalo Palma: Conditional Importing - How to compile for all platforms in Flutter][6]
- [Vyacheslav Egorov: Introduction to Dart VM][7]




## Task

Create a native and web implementations for a custom `DateTime` type, supporting microseconds (unlike the standard [`DateTime`], which [doesn't on web][2]). Use conditional compilation to export the class for general use on any platform.




## Questions

After completing everything above, you should be able to answer (and understand why) the following questions:
- How [Dart] compiles to and works on native platforms? In web?
- What is [Dart] VM? How does it work?
- Why may some libraries be unavailable in web or natively?
- How to check whether [Dart] supports a library on the platform it compiles on?




[`dart:html`]: https://api.flutter.dev/flutter/dart-html/dart-html-library.html
[`dart:io`]: https://api.dart.dev/stable/dart-io/dart-io-library.html
[`dart:js`]: https://api.flutter.dev/flutter/dart-js/dart-js-library.html
[`Date`]: https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Date
[`DateTime`]: https://api.dart.dev/stable/dart-core/DateTime-class.html
[Dart]: https://dart.dev
[HTML]: https://en.wikipedia.org/wiki/HTML
[I/O]: https://en.wikipedia.org/wiki/Input/output
[JavaScript]: https://en.wikipedia.org/wiki/JavaScript

[1]: https://chromium.googlesource.com/chromium/src/+/HEAD/docs/design/sandbox.md
[2]: https://github.com/dart-lang/sdk/issues/44876
[3]: https://dart.dev/overview
[4]: https://dart.dev/web
[5]: https://dart.dev/guides/libraries/create-library-packages#conditionally-importing-and-exporting-library-files
[6]: https://gpalma.pt/blog/conditional-importing
[7]: https://mrale.ph/dartvm
