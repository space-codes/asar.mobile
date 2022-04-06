import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/repositories/api_repo.dart';
import '../../data/models/register_request.dart';

part 'registration_event.dart';

part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  RegistrationBloc() : super(RegistrationInitial()) {
    final RegistrationRepository _apiRepository = RegistrationRepository();

    on<RegisterEvent>((event, emit) async {
      try {
        emit(RegisterLoading());
        final response = await _apiRepository.register(
            userName: event.userName,
            password: event.password,
            confirmPassword: event.confirmPassword);
        emit(RegisterLoaded(response));
        if (response.error != null) {
          emit(RegisterError(response.error));
        }
      } on NetworkError {
        emit(const RegisterError(
            "Failed to fetch data. is your device online?"));
      }
    });
  }
}
