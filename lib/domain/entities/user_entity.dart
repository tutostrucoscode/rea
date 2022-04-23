import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String name;
  final String email;
  final String phoneNumber;
  final bool? isOnline;
  final String uid;
  final String? profileUrl;

  UserEntity({
    required this.name,
    required this.email,
    required this.phoneNumber,
    this.isOnline,
    required this.uid,
    required this.profileUrl,
  });

  @override
  List<dynamic> get props => [
        name,
        email,
        phoneNumber,
        isOnline,
        uid,
        profileUrl,
      ];
}
