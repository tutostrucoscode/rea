import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:rea/domain/repository/firebase_repository.dart';
import 'package:rea/domain/use_cases/auth_use_cases/get_create_current_user_usecase.dart';
import 'package:rea/domain/use_cases/auth_use_cases/get_current_uid_usecase.dart';
import 'package:rea/domain/use_cases/auth_use_cases/is_sign_in_usecase.dart';
import 'package:rea/domain/use_cases/auth_use_cases/register_new_user_usecase.dart';
import 'package:rea/domain/use_cases/auth_use_cases/sign_out_usecase.dart';
import 'package:rea/domain/use_cases/auth_use_cases/sing_in_with_email.dart';
import 'package:rea/infraestructure/firebase/dao/firebase_auth_dao.dart';
import 'package:rea/infraestructure/firebase/firebase_remote_datasource.dart';
import 'package:rea/infraestructure/firebase/firebase_repository_impl.dart';
import 'package:rea/ui/cubit/auth_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //cubit
  sl.registerFactory<AuthCubit>(() => AuthCubit(
        signOutUseCase: sl.call(),
        isSignInUseCase: sl.call(),
        getCurrentUidUseCase: sl.call(),
        singInWithEmail: sl.call(),
        registerNewUser: sl.call(),
      ));

  //user-cases
  sl.registerLazySingleton<SingInWithEmail>(
      () => SingInWithEmail(repository: sl.call()));
  sl.registerLazySingleton<GetCreateCurrentUserUseCase>(
      () => GetCreateCurrentUserUseCase(repository: sl.call()));
  sl.registerLazySingleton<GetCurrentUidUseCase>(
      () => GetCurrentUidUseCase(repository: sl.call()));
  sl.registerLazySingleton<IsSignInUseCase>(
      () => IsSignInUseCase(repository: sl.call()));
  sl.registerLazySingleton<SignOutUseCase>(
      () => SignOutUseCase(repository: sl.call()));
  sl.registerLazySingleton<RegisterNewUser>(
      () => RegisterNewUser(repository: sl.call()));

  //repository
  sl.registerLazySingleton<FirebaseRepository>(() => FirebaseRepositoryImpl(
        remoteAuthDataSource: sl.call(),
      ));

  //remote data
  sl.registerLazySingleton<FirebaseAuthRemoteDataSource>(() => FirebaseAuthDao(
        auth: sl.call(),
        fireStore: sl.call(),
      ));

  //External
  final auth = FirebaseAuth.instance;
  final fireStore = FirebaseFirestore.instance;
  sl.registerLazySingleton(() => auth);
  sl.registerLazySingleton(() => fireStore);
}
