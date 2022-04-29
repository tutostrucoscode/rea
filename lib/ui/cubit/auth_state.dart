part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

class AuthInitial extends AuthState {
  @override
  List<Object> get props => [];
}

class Authenticated extends AuthState {
  final String uid;

  Authenticated({required this.uid});
  @override
  List<Object> get props => [];
}

class UnAuthenticated extends AuthState {
  @override
  List<Object> get props => [];
}

class LogginOk extends AuthState {
  @override
  List<Object> get props => [];
}

class LogginLoad extends AuthState {
  @override
  List<Object> get props => [];
}

class LogginOff extends AuthState {
  @override
  List<Object> get props => [];
}

//Register
class RegisterOk extends AuthState {
  @override
  List<Object> get props => [];
}

class RegisterLoad extends AuthState {
  @override
  List<Object> get props => [];
}

class RegisterOff extends AuthState {
  @override
  List<Object> get props => [];
}
