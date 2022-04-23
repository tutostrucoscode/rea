import 'dart:io';
import 'package:rea/domain/entities/user_entity.dart';

abstract class FirebaseRepository {
  Future<void> signInWithEmail(String email, String password);
  Future<bool> isSignIn();
  Future<void> signOut();
  Future<String> getCurrentUID();
  Future<void> getCreateCurrentUser(UserEntity user);
}
