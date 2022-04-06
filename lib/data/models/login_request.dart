/// username : "string"
/// password : "string"

class LoginRequestModel {
  LoginRequestModel({
    String? username,
    String? password,
  }) {
    _username = username;
    _password = password;
  }

  LoginRequestModel.fromJson(dynamic json) {
    _username = json['username'];
    _password = json['password'];
  }

  String? _username;
  String? _password;

  LoginRequestModel copyWith({
    String? username,
    String? password,
  }) =>
      LoginRequestModel(
        username: username ?? _username,
        password: password ?? _password,
      );

  String? get username => _username;

  String? get password => _password;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['username'] = _username;
    map['password'] = _password;
    return map;
  }

  String? error;

  LoginRequestModel.withError(String errorMessage) {
    error = errorMessage;
  }
}
