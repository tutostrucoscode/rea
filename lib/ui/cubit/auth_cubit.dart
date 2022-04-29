import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rea/domain/entities/user_entity.dart';
import 'package:rea/domain/use_cases/auth_use_cases/get_current_uid_usecase.dart';
import 'package:rea/domain/use_cases/auth_use_cases/is_sign_in_usecase.dart';
import 'package:rea/domain/use_cases/auth_use_cases/register_new_user_usecase.dart';
import 'package:rea/domain/use_cases/auth_use_cases/sign_out_usecase.dart';
import 'package:rea/domain/use_cases/auth_use_cases/sing_in_with_email.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final IsSignInUseCase isSignInUseCase;
  final GetCurrentUidUseCase getCurrentUidUseCase;
  final SignOutUseCase signOutUseCase;
  final SingInWithEmail singInWithEmail;
  final RegisterNewUser registerNewUser;

  AuthCubit({
    required this.isSignInUseCase,
    required this.signOutUseCase,
    required this.getCurrentUidUseCase,
    required this.singInWithEmail,
    required this.registerNewUser,
  }) : super(AuthInitial());

  Future<void> appStarted() async {
    try {
      bool isSignIn = await isSignInUseCase.call();

      if (isSignIn) {
        final uid = await getCurrentUidUseCase.call();
        emit(Authenticated(uid: uid));
      }
      emit(UnAuthenticated());
    } catch (_) {
      emit(UnAuthenticated());
    }
  }

  Future<void> loggedIn(String email, String password) async {
    try {
      emit(LogginLoad());
      await singInWithEmail.call(email, password);
      emit(LogginOk());
    } on SocketException catch (_) {
      emit(LogginOff());
    } catch (_) {
      emit(LogginOff());
    }
  }

  Future<void> loggedOut() async {
    try {
      await signOutUseCase.call();
      emit(UnAuthenticated());
    } catch (_) {}
  }

  Future<void> register(UserEntity user) async {
    try {
      emit(RegisterLoad());
      await registerNewUser.call(user);
      emit(RegisterOk());
    } on SocketException catch (_) {
      emit(RegisterOff());
    } catch (_) {
      emit(RegisterOff());
    }
  }
}
