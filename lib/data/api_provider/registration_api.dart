import 'package:asar_app/constants/strings.dart';
import 'package:asar_app/data/models/default_response.dart';
import 'package:asar_app/data/models/login_request.dart';
import 'package:asar_app/data/models/register_request.dart';
import 'package:dio/dio.dart';

class RegistrationApiProvider {
  final Dio _dio = Dio(
      BaseOptions(baseUrl: baseUrl, headers: {'Content-Type': 'text/plain'}));

  Future<DefaultResponse> login(String password, String userName) async {
    Response response = await _dio.post('auth/login',
        data: LoginRequestModel(password: password, username: userName));
    if (response.statusCode == 200) {
      print(await response.data.toString());
    } else {
      print(response.statusMessage);
    }
    return DefaultResponse.fromJson(response);
  }

  Future<DefaultResponse> register(
      {String? password, String? userName, String? confirmPassword}) async {
    Response response = await _dio.post("auth/register",
        data: RegisterRequestModel(
            confirmPassword: confirmPassword,
            password: password,
            username: userName));
    if (response.statusCode == 200) {
      print(await response.data.toString());
    } else {
      print(response.statusMessage);
    }
    return DefaultResponse.fromJson(response);
  }
}
