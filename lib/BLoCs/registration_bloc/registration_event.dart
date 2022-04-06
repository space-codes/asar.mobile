part of 'registration_bloc.dart';

abstract class RegistrationEvent extends Equatable {
  const RegistrationEvent();
}

class RegisterEvent extends RegistrationEvent {
  final String? userName, password, confirmPassword;

  RegisterEvent({this.userName, this.password, this.confirmPassword});

  @override
  // TODO: implement props
  List<Object?> get props => [userName , password , confirmPassword];}
