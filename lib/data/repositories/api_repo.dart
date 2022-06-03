import 'package:asar_app/data/models/default_response.dart';
import 'package:asar_app/data/models/register_request.dart';

import '../api_provider/registration_api.dart';

class RegistrationRepository {
  final _provider = RegistrationApiProvider();

  Future<DefaultResponse> register(
      {String? password, String? userName, String? confirmPassword}) {
    return _provider.register(
        password: password,
        confirmPassword: confirmPassword,
        userName: userName);
  }
}

class NetworkError extends Error {}
