/// Collection of [messages] allowed to be [read].
class Chat {
  Chat(this.onRead);

  /// Callback, called when this [Chat] should be marked as read until the
  /// provided [int] remotely.
  ///
  /// Intended to be a backend mutation.
  final void Function(int message) onRead;

  /// [List] of messages in this [Chat].
  final List<int> messages = List.generate(30, (i) => i);

  /// Marks this [Chat] as read until the specified [message].
  void read(int message) {
    // TODO: [onRead] should be invoked no more than 1 time in a second.

    onRead(message);
  }
}

Future<void> main() async {
  final Chat chat = Chat((i) => print('Read until $i'));

  chat.read(0);

  await Future.delayed(Duration(milliseconds: 1000));

  chat.read(4);
  await Future.delayed(Duration(milliseconds: 100));
  chat.read(10);
  await Future.delayed(Duration(milliseconds: 100));
  chat.read(11);
  await Future.delayed(Duration(milliseconds: 100));
  chat.read(12);
  await Future.delayed(Duration(milliseconds: 100));
  chat.read(13);
  await Future.delayed(Duration(milliseconds: 100));
  chat.read(14);
  await Future.delayed(Duration(milliseconds: 100));

  chat.read(15);

  await Future.delayed(Duration(milliseconds: 1000));

  chat.read(20);

  await Future.delayed(Duration(milliseconds: 1000));

  chat.read(35);
  await Future.delayed(Duration(milliseconds: 100));
  chat.read(36);
  await Future.delayed(Duration(milliseconds: 500));
  chat.read(37);
  await Future.delayed(Duration(milliseconds: 800));

  chat.read(40);
}
