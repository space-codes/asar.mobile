/// username : "gemy"
/// password : "123456"
/// confirm_password : "123456"

class RegisterRequestModel {
  RegisterRequestModel({
    String? username,
    String? password,
    String? confirmPassword,
  }) {
    _username = username;
    _password = password;
    _confirmPassword = confirmPassword;
  }

  RegisterRequestModel.fromJson(dynamic json) {
    _username = json['username'];
    _password = json['password'];
    _confirmPassword = json['confirm_password'];
  }

  String? _username;
  String? _password;
  String? _confirmPassword;

  RegisterRequestModel copyWith({
    String? username,
    String? password,
    String? confirmPassword,
  }) =>
      RegisterRequestModel(
        username: username ?? _username,
        password: password ?? _password,
        confirmPassword: confirmPassword ?? _confirmPassword,
      );

  String? get username => _username;

  String? get password => _password;

  String? get confirmPassword => _confirmPassword;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['username'] = _username;
    map['password'] = _password;
    map['confirm_password'] = _confirmPassword;
    return map;
  }

  String? error;

  RegisterRequestModel.withError(String errorMessage) {
    error = errorMessage;
  }
}
