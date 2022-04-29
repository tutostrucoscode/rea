import 'package:rea/domain/entities/user_entity.dart';
import 'package:rea/domain/repository/firebase_repository.dart';

class RegisterNewUser {
  final FirebaseRepository repository;

  RegisterNewUser({required this.repository});

  Future<void> call(UserEntity user) async {
    repository.registerNewUser(user);
  }
}
