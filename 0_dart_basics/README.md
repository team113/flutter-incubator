Step 0: Become familiar with Dart basics
========================================

**Estimated time**: 1 day

Read and firmly study the [Dart Overview], provided by the [Dart] team. Learn about the language basics (syntax, types, functions, classes, asynchronous programming).

Be sure to check out the [Effective Dart] guidelines for writing consistent [Dart] code.

Investigate the [Core Libraries] available in [Dart], and learn how to enable [Dart Packages] and dependencies to use in your [Dart] project. You may explore the [pub.dev] for community made packages.

To practice the theory you may pass the [Dart Cheatsheet].




## Questions

After completing the steps above, you should be able to answer (and understand why) the following questions:
- **What runtime [Dart] has? Does it use a GC (garbage collector)?**
- Dart's compiler technology run code in different ways:
**Dart VM (JIT / Development mode):** During development, a fast developer cycle is critical for iteration. The Dart VM offers a just-in-time compiler (JIT) with incremental recompilation (enabling hot reload), live metrics collections (powering DevTools), and rich debugging support.
**Ahead-of-Time (AOT) compiled mode:** When apps are ready to be deployed to production, the Dart ahead-of-time (AOT) compiler can compile to native ARM or x64 machine code. In AOT mode, the runtime includes memory management (like Garbage Collection).
**Garbage Collection:** It's optimized for UI frameworks (like Flutter), where you create and discard lots of short-lived objects (widgets, state objects, etc.). Dart’s garbage collector is generational and consists of two phases: the young space scavenger and parallel mark sweep collectors. The garbage collector can also run sliding compaction during those idle intervals, which minimizes memory overhead by reducing memory fragmentation. Young objects (short-lived, like temporary widget trees) are collected quickly. Old objects (long-lived, like app state) are promoted and collected less frequently. This keeps GC fast and efficient, avoiding noticeable UI jank.


- **What is [Dart] VM? How [Dart] works natively and in a browser, and why?**
- The Dart VM is the runtime environment for executing Dart programs like the JVM (Java Virtual Machine) or V8 (JavaScript engine). It provides: JIT (Just-In-Time) compilation → fast hot reload / development, Garbage Collection → automatic memory management, Native interoperability → call into C/C++ system libraries, Isolates → lightweight concurrency model (instead of shared threads).
-> Dart supports Ahead-of-Time (AOT) compilation. In Flutter release mode, Dart code is compiled into native ARM/x64 machine code. No VM is shipped inside your mobile app → it runs like a C++ program. The Dart runtime is very small, providing just: GC, Isolate scheduler, Core libraries (dart:core, dart:async, etc.). This gives fast startup and predictable performance, close to C++.
-> Mobile apps need smooth 60/120 FPS performance. JIT would make startup slow, and a full VM would bloat binaries. AOT → small, optimized binary, no runtime dependency.
-> Dart does not ship a VM into the browser (unlike Java Applets or Flash, which failed).
Instead:
Dart source → compiled to JavaScript by the dart2js compiler.
Optimized JS runs in the browser’s native JS engine (V8, SpiderMonkey, etc.).
For development → dartdevc (Dart Dev Compiler) provides fast incremental compilation to JS.
Supports hot reload in Flutter Web.
Browsers only natively run JavaScript, WASM, and assembly-like bytecode. Shipping a Dart VM plugin would make adoption impossible (security and install issues). Compiling to JS means Dart apps run anywhere JS runs.
Dart was designed with two main goals:
1) **Developer productivity → JIT on Dart VM (fast hot reload)**
2) **Production performance → AOT native code or JS (small, fast, portable)**
So:
**Native apps (Flutter, CLI, servers) → Dart VM in dev, AOT in prod.**
**Web apps → compile to JS**


  
- **What is JIT and AOT compilation? Which one [Dart] supports?**
- Dart supports Both JIT and AOT compilation. 
**1) JIT (Just-In-Time) Compilation:**
-> Code is compiled while the program runs.
-> The VM translates Dart source → bytecode → machine code.
**Advantages:**
 - Fast development cycles (supports hot reload in Flutter).
 - Can optimize based on actual runtime behavior.
**Disadvantages:**
 - Slower startup (must compile as it runs).
 - Slightly larger memory overhead (keeps compiler + metadata in RAM).
Example: Flutter debug mode uses JIT → so you can hot reload instantly.
**2) AOT (Ahead-Of-Time) Compilation:**
-> Code is compiled into machine code before running.
-> No need for a full VM at runtime → app runs like a C++ binary.
**Advantages:**
 - Fast startup.
 - Small memory footprint.
 - Predictable performance (great for mobile apps).
**Disadvantages:**
 - No hot reload (requires full rebuild).
 - Less runtime optimization (since code is fixed).
Example: Flutter release mode uses AOT → giving smooth 60/120 FPS apps.
**Conclusion: For Developer productivity → JIT for hot reload used and For Production performance → AOT for fast startup and efficiency.**

  
-**What statically typing means? What is a benefit of using it?**
- **A statically typed language is one where variable types are known at compile time (before the program runs).** This means the compiler enforces rules about what type of data can be stored in a variable or passed to a function.
Example, 
int age = 25;     // valid
age = "hello";    // compile-time error (string not assignable to int)
Here, the compiler already knows that age must be an int, so it stops you from assigning a string before the program even runs.
**Benefits of static typing:**
 - Catch errors early (at compile time)
 - IDEs can provide autocompletion, refactoring, and code navigation because they know variable types.
 - Since the compiler knows types ahead of time, it can generate faster, more optimized code.
 - Large projects are easier to understand — you can see the type of each variable, function, and return value without guessing.
 - Code is clearer for other developers
ex, 
var name = "Alice"; // inferred as String
var age = 30;       // inferred as int

  
- **What memory model [Dart] has? Is it single-threaded or multiple-threaded?**
- **Dart uses a managed memory model with automatic garbage collection (GC).** Memory is heap-allocated, and objects are collected using a generational GC (fast collection of short-lived objects, promotion of long-lived ones).
**Dart is not purely single-threaded, but it’s also not “shared-memory multi-threaded” like Java or C++.**
Instead, Dart uses isolates: 
Each isolate has Its own memory heap (no shared mutable memory) and Its own event loop (like JavaScript).
Isolates do not share objects directly. they communicate by passing messages (copies or transferable objects).
This avoids: Data races, Locks / deadlocks, Complex synchronization
Inside one isolate → execution is single-threaded (like JavaScript).
Across multiple isolates → Dart can run on multiple CPU cores in parallel.

  
- **Does [Dart] has asynchronous programming? Parallel programming?**
- **Yes Dart supports both asynchronous programming and parallel programming**. Dart has built-in support for **asynchronous programming using Future, async/await, and Stream**. It uses a single-threaded event loop model similar to JavaScript, which allows non-blocking I/O operations like network calls, file handling, and timers. This ensures the main isolate (UI thread in Flutter) stays responsive while waiting for asynchronous tasks.
**Dart supports parallel execution using isolates**. Each isolate has its own memory and event loop. They run on separate threads/CPU cores and communicate via message passing, not shared memory. This avoids race conditions and makes concurrency safer.
**Asynchronous programming (Futures/Streams) handles I/O-bound tasks, while isolates are used for CPU-bound tasks like image processing or heavy computation.**

  
- **Is [Dart] OOP language? Does it have an inheritance?**
- **Yes, Dart is a fully object-oriented language. In Dart, everything is an object, including numbers, functions, and even null.** It supports the core OOP principles: **encapsulation, inheritance, and polymorphism. Dart also has features like classes, abstract classes, mixins, interfaces (via implicit contracts), and generics.**
**Dart supports single inheritance**, meaning a class can extend only one superclass. This helps keep the class hierarchy simple and avoids the complexity of multiple inheritance. 
**Ex,**
class Animal {
  void speak() => print("Animal sound");
}
class Dog extends Animal {
  @override
  void speak() => print("Bark");
}

**Dart also provides mixins and implements to achieve code reuse and multiple behavioral contracts without multiple inheritance.**
**Mixins Example,** 
A mixin is a way to reuse code in multiple classes without using inheritance. **In Dart, use the with keyword for mixin.**
mixin Logger {
  void log(String message) {
    print("Log: $message");
  }
}
mixin Serializer {
  String toJson() => '{"status":"ok"}';
}
class Service with Logger, Serializer {
  void fetchData() {
    log("Fetching data...");
  }
}

**Implements Example,**
Using implements, a class can promise to follow multiple contracts (like interfaces in Java). The class must provide its own implementation of all methods.
abstract class Drivable {
  void drive();
}
abstract class Flyable {
  void fly();
}
class FlyingCar implements Drivable, Flyable {
  @override
  void drive() => print("Driving on the road");

  @override
  void fly() => print("Flying in the sky");
}


  

Once you're done, notify your mentor/lead in the appropriate [PR (pull request)][PR] (checkmark this step in [README](../README.md)), and he will examine what you have learned.




[Core Libraries]: https://dart.dev/guides/libraries
[Dart]: https://dart.dev
[Dart Cheatsheet]: https://dart.dev/codelabs/dart-cheatsheet
[Dart Overview]: https://dart.dev/overview
[Dart Packages]: https://dart.dev/guides/packages
[Effective Dart]: https://dart.dev/guides/language/effective-dart
[PR]: https://help.github.com/articles/github-glossary#pull-request
[pub.dev]: https://pub.dev
