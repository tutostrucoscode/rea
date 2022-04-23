import 'package:rea/domain/repository/firebase_repository.dart';

class SingInWithEmail {
  final FirebaseRepository repository;

  SingInWithEmail({required this.repository});

  Future<void> call(String username, String password) async {
    repository.signInWithEmail(username, password);
  }
}
