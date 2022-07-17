import 'package:asar_app/constants/strings.dart';
import 'package:asar_app/data/models/default_response.dart';
import 'package:asar_app/data/models/home_response.dart';
import 'package:asar_app/data/models/login_request.dart';
import 'package:asar_app/data/models/register_request.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiProvider {
  final Dio _dio_for_post = Dio(BaseOptions(baseUrl: baseUrl, headers: {
    'Content-Type': 'application/json',
  }));
  final Dio _dio_for_get = Dio(BaseOptions(
    baseUrl: baseUrl,
    validateStatus: (_) => true,
    contentType: Headers.jsonContentType,
    responseType: ResponseType.json,
  ));

  Future<DefaultResponse> login(
      {required String password, required String userName}) async {
    debugPrint("****** From login request model ----> ${userName} ***********");

    Response response = await _dio_for_post.post('auth/login',
        data:
            LoginRequestModel(password: password, username: userName).toJson());

    if (response.statusCode == 200) {
      print(await response.data.toString());
    } else {
      print(response.statusMessage);
    }
    return DefaultResponse(message: response.data.toString());
  }

  Future<DefaultResponse> register(
      {String? password, String? userName, String? confirmPassword}) async {
    debugPrint(
        "****** From register request model ----> ${userName} ***********");

    Response response = await _dio_for_post.post("auth/register",
        data: RegisterRequestModel(
                confirmPassword: confirmPassword,
                password: password,
                username: userName)
            .toJson());

    if (response.statusCode == 200) {
      print(await response.data.toString());
    } else {
      print(response.statusMessage);
    }
    return DefaultResponse(message: response.data.toString());
  }

  Future<DefaultResponse> logout() async {
    Response response = await _dio_for_post.post(
      'auth/logout',
    );

    print(await response.data.toString());

    if (response.statusCode == 200) {
      print(await response.data.toString());
    } else {
      print(response.statusMessage);
    }
    return DefaultResponse.fromJson(response);
  }

  Future<DefaultResponse> predict({required String image}) async {
    Response response =
        await _dio_for_post.post('predict', data: {"image": image});
    debugPrint("****** From predict request model ***********");
    if (response.statusCode == 200) {
      print(await response.data.toString());
    } else {
      print(response.statusMessage);
    }
    return DefaultResponse.fromJson(response);
  }

  Future<HomeResponse> home() async {
    Response response = await _dio_for_get.get('home');
    debugPrint("****** From home request model ***********");
    if (response.statusCode == 200) {
      print(await response.data.toString());
    } else {
      print(response.statusMessage);
    }
    return HomeResponse.fromJson(response.data);
  }
}
