import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String name;
  final String email;
  final String password;
  final bool? isOnline;
  final String uid;
  final String? profileUrl;

  const UserEntity(
      {required this.name,
      required this.email,
      required this.password,
      this.isOnline,
      required this.uid,
      required this.profileUrl});

  @override
  List<dynamic> get props => [
        name,
        email,
        password,
        isOnline,
        uid,
        profileUrl,
      ];
}
