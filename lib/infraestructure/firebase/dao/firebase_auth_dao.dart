import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rea/domain/entities/user_entity.dart';
import 'package:rea/domain/models/user_model.dart';
import 'package:rea/infraestructure/firebase/firebase_remote_datasource.dart';
import 'package:rea/ui/utils/vars.dart';

class FirebaseAuthDao implements FirebaseAuthRemoteDataSource {
  final FirebaseAuth auth;
  final FirebaseFirestore fireStore;

  FirebaseAuthDao({
    required this.auth,
    required this.fireStore,
  });

  @override
  Future<void> getCreateCurrentUser(UserEntity user) async {
    final userCollection = fireStore.collection("users");
    final uid = await getCurrentUID();
    userCollection.doc(uid).get().then((userDoc) {
      final newUser = UserModel(email: user.email, uid: user.uid).toMap();
      if (!userDoc.exists) {
        //Se crea un nuevo usuario
        userCollection.doc(uid).set(newUser);
      } else {
        //Se actualiza el usuario
        userCollection.doc(uid).update(newUser);
      }
    });
  }

  @override
  Future<String> getCurrentUID() async => auth.currentUser!.uid;

  @override
  Future<bool> isSignIn() async => auth.currentUser?.uid != null;

  @override
  Future<void> signInWithEmail(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  @override
  Future<void> signOut() async => await auth.signOut();

  @override
  Future<void> registerNewUser(user) async {
    try {
      await auth.createUserWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        print('Email is already in use with that user.');
      }
    }
  }
}
