/// Item in a chat.
abstract class ChatItem {}

/// [ChatItem] representing a text message.
class ChatMessage extends ChatItem {}

/// [ChatItem] representing a call.
class ChatCall extends ChatItem {}

/// [ChatItem] representing an action happened in a chat.
class ChatInfo extends ChatItem {}

/// [ChatItem] representing a forwarded message.
class ChatForward extends ChatItem {}

/// Quote of a [ChatItem].
abstract class ChatItemQuote {
  const ChatItemQuote({
    required this.original,
    required this.at,
  });

  /// Constructs a [ChatItemQuote] from the provided [item].
  factory ChatItemQuote.from(ChatItem item) {
    throw UnimplementedError('Implement me');
  }

  /// Quoted [ChatItem] itself.
  final ChatItem original;

  /// [DateTime] when this [ChatItemQuote] was created.
  final DateTime at;
}

/// [ChatItemQuote] of a [ChatMessage].
class ChatMessageQuote extends ChatItemQuote {
  const ChatMessageQuote({required super.original, required super.at});
}

/// [ChatItemQuote] of a [ChatCall].
class ChatCallQuote extends ChatItemQuote {
  const ChatCallQuote({required super.original, required super.at});
}

/// [ChatItemQuote] of a [ChatInfo].
class ChatInfoQuote extends ChatItemQuote {
  const ChatInfoQuote({required super.original, required super.at});
}

/// [ChatItemQuote] of a [ChatForward].
class ChatForwardQuote extends ChatItemQuote {
  const ChatForwardQuote({required super.original, required super.at});
}
