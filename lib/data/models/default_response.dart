/// message : "string"

class DefaultResponse {
  DefaultResponse({
    String? message,
  }) {
    _message = message;
  }

  DefaultResponse.fromJson(dynamic json) {
    _message = json['message'];
  }

  String? _message;

  DefaultResponse copyWith({
    String? message,
  }) =>
      DefaultResponse(
        message: message ?? _message,
      );

  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    return map;
  }
}
