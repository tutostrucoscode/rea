import '../entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required String name,
    required String email,
    required String phoneNumber,
    bool? isOnline,
    required String uid,
    String? profileUrl,
  }) : super(
          name: name,
          email: email,
          phoneNumber: phoneNumber,
          isOnline: isOnline,
          uid: uid,
          profileUrl: profileUrl,
        );

  factory UserModel.fromSnapshot(snapshot) {
    return UserModel(
      name: snapshot.data()['name'],
      email: snapshot.data()['email'],
      phoneNumber: snapshot.data()['phoneNumber'],
      uid: snapshot.data()['uid'],
      isOnline: snapshot.data()['isOnline'],
      profileUrl: snapshot.data()['profileUrl'],
    );
  }

  Map<String, dynamic> toDocument() {
    return {
      "name": name,
      "email": email,
      "phoneNumber": phoneNumber,
      "uid": uid,
      "isOnline": isOnline,
      "profileUrl": profileUrl
    };
  }
}
