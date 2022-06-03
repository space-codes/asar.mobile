part of 'registration_bloc.dart';

abstract class RegistrationState extends Equatable {
  const RegistrationState();
}

class RegistrationInitial extends RegistrationState {
  @override
  List<Object> get props => [];
}

class RegisterLoading extends RegistrationState {
  @override
  List<Object?> get props => [];
}

class RegisterLoaded extends RegistrationState {
  final DefaultResponse registerModel;

  const RegisterLoaded(this.registerModel);

  @override
  List<Object?> get props => [];
}

class RegisterError extends RegistrationState {
  final String? message;

  const RegisterError(this.message);

  @override
  List<Object?> get props => [];
}
