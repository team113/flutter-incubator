Step 1.2: Async and isolates
============================

**Estimated time**: 1 day

The nowadays digital world would be impossible without the concept of [multitasking][101] (imagine a [server][102] that can process only a single request at the same time, or an [operating system][103] that is able to run only a single program). [Multitasking][101] comes in many forms, but it's always about [concurrent][104] execution of multiple tasks, bound by some limited in time resource. The most common and practical dichotomy of such possible resources is:
- [CPU-bound] problems, where the time to complete a task is determined principally **by the speed of the [CPU]** (for example, neural networks computations, cryptographic algorithms, video encoding/rendering, etc).
- [I/O-bound] problems, where the time to complete a task is determined principally **by the period spent waiting for [I/O operations] to be completed** (for example, accessing database, sending HTTP request, reading a file, etc).

For [CPU-bound] problems the most traditional tools for organizing [multitasking][101] are: 
- [Multithreading][114], which allow scheduling new tasks (called "[threads][106]"), attached by an [operating system][103] to different [CPU] cores, and managed in [preemptive][107] manner.
- [SIMD] instructions, which allow to execute the same [CPU] operation for multiple elements at the same time (as a single [CPU] instruction).

For [I/O-bound] problems the most traditional tool for organizing [multitasking][101] is [asynchronous programming][109], which utilizes [non-blocking I/O operations][110] to omit blocking the [thread][106] the tasks are executing on, and comes with an asynchronous runtime (either [preemptive][107] or [cooperative][108]), providing an [event loop][111] for executing and driving tasks to completion, wrapped into usable asynchronous abstractions (such as [futures][112] or [coroutines][113]).

Another useful dichotomy for [multitasking][101] is:
- [Concurrency][104], which is about multiple tasks **making progress at the same time**.
- [Parallelism][115], which is about multiple tasks **running at the same time**.

For better understanding, read through the following articles:
- [GeeksforGeeks: Thread in Operating System][121]
- [Nader Medhat: Tasks Scheduling in OS][124]
- [Jonathan Johnson: Asynchronous Programming: A Beginner’s Guide][122]
- [Ossian: Synchronous Vs. Asynchronous: A Guide To Choosing The Ideal Programming Model][123]
- [Nicky Meuleman: Concurrent vs parallel][125]
- [Khaja Shaik: Concurrency vs Parallelism: 2 sides of same Coin 🤨 ??.][126]




## Async

[Dart] provides a [first-class support][202] for [asynchronous programming][109] in form of [futures][112] and [`async`/`await`][201]. 

> Dart libraries are full of functions that return [`Future`] or [`Stream`] objects. These functions are asynchronous: they return after setting up a possibly time-consuming operation (such as I/O), without waiting for that operation to complete.
>
> The `async` and `await` keywords support asynchronous programming, letting you write asynchronous code that looks similar to synchronous code.

> To use `await`, code must be in an async function — a function marked as `async`:
> ```dart
> Future<void> checkVersion() async {
>   var version = await lookUpVersion();
>   // Do something with version
> }
> ```

**[`Stream`] represents a sequence of [`Future`]s**:
> A stream is a sequence of asynchronous events. It is like an asynchronous `Iterable` - where, instead of getting the next event when you ask for it, the stream tells you that there is an event when it is ready.

```dart
import 'dart:async';

void main() {
  // Creating a stream controller
  StreamController<int> controller = StreamController<int>();

  // Creating a stream from the stream controller
  Stream<int> stream = controller.stream;

  // Subscribing to the stream
  StreamSubscription<int> subscription = stream.listen(
    (int value) {
      print('Received: $value');
    },
    onError: (error) {
      print('Error occurred: $error');
    },
    onDone: () {
      print('Stream is done');
    },
  );

  // Adding values to the stream
  controller.sink.add(1);
  controller.sink.add(2);
  controller.sink.add(3);

  // Closing the stream
  controller.close();

  // Canceling the subscription
  subscription.cancel();
}
```

Another important and widely used asynchronous abstraction in [Dart] is a [`Timer`]:
> A countdown timer that can be configured to fire once or repeatedly.

```dart
import 'dart:async';

void main() {
  print('Start');
  
  Timer(Duration(seconds: 2), () {
    print('Two seconds have passed!');
  });
  
  print('End');
}
```

For better understanding of [asynchronous programming][109] design and usage in [Dart], read through the following articles:
- [Dart SDK: Future][`Future`]
- [Dart SDK: Stream][`Stream`]
- [Dart SDK: Timer][`Timer`]
- [Dart Docs: Asynchrony support][203]
- [Dart Codelabs: Asynchronous programming: futures, async, await][204]
- [Dart Codelabs: Asynchronous programming: Streams][205]
- [Lasse Nielsen: Creating streams in Dart][206]
- [Abdurrahman Fadhil: Asynchronous Programming in Dart][207]
- [Shaiq Khan: Exploring Asynchronous Programming In Dart & Flutter][208]




## Isolates

[Dart] supports [multithreading][114] in form of [`Isolate`]s. They are intentionally named this way to emphasize that **multiple [`Isolate`]s do not share any memory**, unlike traditional mechanisms ([pthreads] ([POSIX] threads), [OpenMP], etc) requiring a [multithread synchronization][301], but rather communicate via [message passing][302].

> Within an app, all Dart code runs in an isolate. Each Dart isolate has a single thread of execution and shares no mutable objects with other isolates. To communicate with each other, isolates use message passing. Many Dart apps use only one isolate, the main isolate. You can create additional isolates to enable parallel code execution on multiple processor cores.

> Instead of threads, all Dart code runs inside of isolates. Each isolate has its own memory heap, ensuring that none of the state in an isolate is accessible from any other isolate. Because there’s no shared memory, you don’t have to worry about [mutexes or locks][303].
>
> Using isolates, your Dart code can perform multiple independent tasks at once, using additional processor cores if they’re available. Isolates are like threads or processes, but each isolate has its own memory and a single thread running an event loop.

For better understanding of [`Isolate`]'s design and usage, read through the following articles:
- [Dart SDK: Isolate][`Isolate`]
- [Dart Docs: Concurrency in Dart][304]




## Task

- [`task_1.dart`](task_1.dart): make the `Chat.read` method to invoke the `Chat.onRead` callback debounced.
- [`task_2.dart`](task_2.dart): implement the `Client.connect` method re-connecting to a server using a [backoff algorithm][401].
- [`task_3.dart`](task_3.dart): implement an [`HttpServer`] writing to a `dummy.txt` file on any of its routes and returning its contents (reading from it) on another. Note, that `dummy.txt` might not exist when trying to read from it, server should respond with an error in such case.
- [`task_4.dart`](task_4.dart): implement an algorithm calculating sum of prime numbers from 1 to N using [`Isolate`]s.




## Questions

After completing everything above, you should be able to answer (and understand why) the following questions:
- What is multitasking? Why it exists? How is it used for solving CPU-bound and I/O-bound problems?
- What is preemptive multitasking? What is cooperative multitasking? Which one is used in [Dart]?
- What is asynchronous programming and when do we need it? How is it represented in [Dart]?
- What is a [`Stream`] and how this abstraction is useful? Give some real-world examples of using it.
- What is a [`Timer`] and how this abstraction is useful? Give some real-world examples of using it.
- How does [Dart] handles multiple [`Isolate`]s? How do they communicate with each other? How to share memory between [`Isolate`]s?
- How `Isolate.spawn` and `Isolate.spawnUri` are different?
- What is concurrency and how is it different from parallelism? How both are represented in [Dart]?




[`Future`]: https://api.dart.dev/stable/dart-async/Future-class.html
[`HttpServer`]: https://api.dart.dev/stable/dart-io/HttpServer-class.html
[`Isolate`]: https://api.dart.dev/stable/dart-isolate/Isolate-class.html
[`Stream`]: https://api.dart.dev/stable/dart-async/Stream-class.html
[`Timer`]: https://api.dart.dev/stable/dart-async/Timer-class.html
[CPU]: https://en.wikipedia.org/wiki/Central_processing_unit
[CPU-bound]: https://en.wikipedia.org/wiki/CPU-bound
[Dart]: https://dart.dev
[I/O-bound]: https://en.wikipedia.org/wiki/I/O_bound
[OpenMP]: https://en.wikipedia.org/wiki/OpenMP
[POSIX]: https://en.wikipedia.org/wiki/POSIX
[pthreads]: https://en.wikipedia.org/wiki/Pthreads
[SIMD]: https://en.wikipedia.org/wiki/SIMD

[101]: https://en.wikipedia.org/wiki/Computer_multitasking
[102]: https://en.wikipedia.org/wiki/Server_(computing)
[103]: https://en.wikipedia.org/wiki/Operating_system
[104]: https://en.wikipedia.org/wiki/Concurrent_computing
[105]: https://en.wikipedia.org/wiki/Input/output
[106]: https://en.wikipedia.org/wiki/Thread_(computing)
[107]: https://en.wikipedia.org/wiki/Preemption_(computing)
[108]: https://en.wikipedia.org/wiki/Cooperative_multitasking
[109]: https://en.wikipedia.org/wiki/Asynchrony_(computer_programming)
[110]: https://en.wikipedia.org/wiki/Asynchronous_I/O
[111]: https://en.wikipedia.org/wiki/Event_loop
[112]: https://en.wikipedia.org/wiki/Futures_and_promises
[113]: https://en.wikipedia.org/wiki/Coroutine
[114]: https://en.wikipedia.org/wiki/Multithreading_(computer_architecture)
[115]: https://en.wikipedia.org/wiki/Parallel_computing
[121]: https://www.geeksforgeeks.org/thread-in-operating-system
[122]: https://www.bmc.com/blogs/asynchronous-programming
[123]: https://www.datamyte.com/synchronous-vs-asynchronous
[124]: https://medium.com/nerd-for-tech/tasks-scheduling-in-os-2c1f99e9dc05
[125]: https://nickymeuleman.netlify.app/garden/concurrent-vs-parallel
[126]: https://www.linkedin.com/pulse/concurrency-vs-parallelism-2-sides-same-coin-khaja-shaik-
[201]: https://en.wikipedia.org/wiki/Async/await
[202]: https://api.dart.dev/stable/dart-async/dart-async-library.html
[203]: https://dart.dev/language/async
[204]: https://dart.dev/codelabs/async-await
[205]: https://dart.dev/tutorials/language/streams
[206]: https://dart.dev/articles/libraries/creating-streams
[207]: https://rahmanfadhil.com/asynchronous-dart
[208]: https://medium.flutterdevs.com/exploring-asynchronous-programming-in-dart-flutter-25f341af32f
[301]: https://en.wikipedia.org/wiki/Thread_(computing)#Threads_and_data_synchronization
[302]: https://en.wikipedia.org/wiki/Message_passing
[303]: https://en.wikipedia.org/wiki/Lock_(computer_science)
[304]: https://dart.dev/language/concurrency
[401]: https://en.wikipedia.org/wiki/Exponential_backoff
