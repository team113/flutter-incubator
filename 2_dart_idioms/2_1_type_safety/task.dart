class User {
  const User({
    required this.id,
    this.name,
    this.bio,
  });

  /// TODO: ID should be always 36 characters long and be in [UUIDv4] format.
  ///
  /// [UUIDv4]: https://en.wikipedia.org/wiki/Universally_unique_identifier
  final String id;

  /// TODO: Name should be always 4 - 32 characters long, contain only
  ///       alphabetical letters.
  final String? name;

  /// TODO: Biography must be no longer than 255 characters.
  final String? bio;
}

class Backend {
  getUser(String id) async => User(id: id);
  putUser(String id, {String? name, String? bio}) async {}
}

class UserService {
  UserService(this.backend);

  final backend;

  get(String id) async {}
  update(User user) async {}
}

void main() {
  // Do the following:
  // - fix missing explicit types;
  // - decompose the types using the newtype idiom;
  // - add documentation following the "Effective Dart: Documentation"
  //   guidelines.
}
