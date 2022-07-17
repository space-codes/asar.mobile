import 'package:asar_app/data/api_provider/api_provider.dart';
import 'package:asar_app/data/models/default_response.dart';
import 'package:flutter/material.dart';

class RegistrationProvider with ChangeNotifier {
  DefaultResponse loginResponse = DefaultResponse();
  DefaultResponse registerResponse = DefaultResponse();
  bool loginLoading = false;
  bool registerLoading = false;

  Future login({password, userName}) async {
    loginLoading = true;
    loginResponse = await ApiProvider()
        .login(userName: userName, password: password);
    loginLoading = false;

    notifyListeners();
  }

  register({password, userName, confirmPassword}) async {
    registerLoading = true;
    registerResponse = await ApiProvider().register(
        password: password,
        confirmPassword: confirmPassword,
        userName: userName);
    registerLoading = false;

    notifyListeners();
  }
}
