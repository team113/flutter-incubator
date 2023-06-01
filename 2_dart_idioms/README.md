Step 2: Dart idioms
===================

**Estimated time**: 1 day

These steps describe the common [Dart] idioms used to write idiomatic code.

**Before completing this step, you should complete all its sub-steps.**




## Task

Write a simple business logic [domain][1]-layer for an [imageboard][3]-like application:
- implement `Board` and `Message` entities, following the [newtype idiom][2];
- provide `BoardsRepository` and `MessagesRepository` with multiple implementations: in-memory, storing the data, and a [mock][4] for testing;
- anyone can create `Board`s, post `Message`s in them with any name they choose (or be anonymous at all);
- follow the [SOLID] principles.




[Dart]: https://dart.dev
[SOLID]: https://en.wikipedia.org/wiki/SOLID

[1]: https://en.wikipedia.org/wiki/Domain_(software_engineering)
[2]: https://github.com/dart-lang/language/issues/2132
[3]: https://en.wikipedia.org/wiki/Imageboard
[4]: https://en.wikipedia.org/wiki/Mock_object
