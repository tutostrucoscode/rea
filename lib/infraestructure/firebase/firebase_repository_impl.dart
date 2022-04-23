import 'dart:io';
import 'package:rea/domain/entities/user_entity.dart';
import 'package:rea/domain/repository/firebase_repository.dart';
import 'package:rea/infraestructure/firebase/firebase_remote_datasource.dart';

class FirebaseRepositoryImpl implements FirebaseRepository {
  final FirebaseAuthRemoteDataSource remoteAuthDataSource;

  FirebaseRepositoryImpl({
    required this.remoteAuthDataSource,
  });

  @override
  Future<void> getCreateCurrentUser(UserEntity user) async =>
      await remoteAuthDataSource.getCreateCurrentUser(user);

  @override
  Future<String> getCurrentUID() async =>
      await remoteAuthDataSource.getCurrentUID();
  @override
  Future<bool> isSignIn() async => await remoteAuthDataSource.isSignIn();

  @override
  Future<void> signInWithEmail(String email, String password) async =>
      await remoteAuthDataSource.signInWithEmail(email, password);

  @override
  Future<void> signOut() async => await remoteAuthDataSource.signOut();
}
