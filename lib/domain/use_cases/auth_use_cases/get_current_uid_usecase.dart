import 'package:rea/domain/repository/firebase_repository.dart';

class GetCurrentUidUseCase {
  final FirebaseRepository repository;

  GetCurrentUidUseCase({required this.repository});

  Future<String> call() async {
    return await repository.getCurrentUID();
  }
}
