class AuthLocal {
  static final Map<String, String> _users = {
    'mathias':'mathias123',
    'admin': '123456',
    'teste': 'teste',
    'bob': 'qwerty',
  };

  static bool validate(String username, String password) {
    final pass = _users[username.trim()];
    return pass != null && pass == password;
  }
}
