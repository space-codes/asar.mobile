import 'dart:io';

import 'package:asar_app/constants/global_vars.dart';
import 'package:asar_app/constants/strings.dart';
import 'package:asar_app/data/models/default_response.dart';
import 'package:asar_app/data/models/home_response.dart';
import 'package:asar_app/data/models/login_request.dart';
import 'package:asar_app/data/models/register_request.dart';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiProvider {




  final Dio dio = Dio(BaseOptions(
    baseUrl: baseUrl,
    validateStatus: (_) => true,
    contentType: Headers.jsonContentType,
    responseType: ResponseType.json,
  ));



  Future<DefaultResponse> login(
      {required String password, required String userName}) async {
    debugPrint("****** From login request model ----> ${userName} ***********");
    String message = "" ;
    Response response = await dio.post('auth/login',
        data:
        LoginRequestModel(password: password, username: userName).toJson());

    if (response.statusCode == 200) {
      var test = await response.headers['set-cookie']?[0];
      message = test!.substring(8, test.length-18);
      print(message);
    } else {
      print(response.statusMessage);
    }
    return DefaultResponse(message: message);
  }

  Future<DefaultResponse> register(
      {String? password, String? userName, String? confirmPassword}) async {
    debugPrint(
        "****** From register request model ----> ${userName} ***********");

    Response response = await dio.post("auth/register",
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
    Response response = await dio.post(
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

  // Future<DefaultResponse> predict({required String image}) async {
  //   Response response =
  //       await _dio_for_post.post('predict', data: {"image": "data:image/png;base64,$image"});
  //   debugPrint("****** From predict request model ***********");
  //   if (response.statusCode == 200) {
  //     print(await response.data.toString());
  //   } else {
  //     print(response.statusMessage);
  //   }
  //   return DefaultResponse.fromJson(response);
  // }

  Future<DefaultResponse> predict({required File image}) async {
    dio.options.headers = {
      "Cookie" :"session=$cookie"
    };
    FormData formData = FormData.fromMap({
      "image":
      await MultipartFile.fromFile(image.path, filename: "fileName"),
    });

    Response response = await dio.post('predict', data: formData);
    debugPrint("****** From predict request model ***********");
    if (response.statusCode == 200) {
      print(await response.data.toString());
    } else {
      print(response.statusMessage);
    }
    return DefaultResponse(message: response.data.toString());
  }

  Future<HomeResponse> home() async {
    dio.options.headers = {
      "Cookie" :"session=$cookie"
    };
    Response response = await dio.get('home');

    debugPrint("****** From home request model ***********");
    if (response.statusCode == 200) {
      print(await response.data.toString());
    } else {
      print(response.statusMessage);
    }
    return HomeResponse.fromJson(response.data);
  }
}
