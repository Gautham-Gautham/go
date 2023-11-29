
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Model/user.dart';
import '../../../core/failure.dart';
import '../../../core/providers/firebaseProviders.dart';
import '../../../core/type_def.dart';

final authRepositoryProvider = Provider((ref) => Auth_Repository(
    firestore: ref.read(fireStroeProvider),
    auth: ref.read(authProvider),
    googleSignIn: ref.read(googleSigninProvider)));

class Auth_Repository {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;
  final GoogleSignIn _googleSignIn;

  Auth_Repository(
      {required FirebaseFirestore firestore,
        required FirebaseAuth auth,
        required GoogleSignIn googleSignIn})
      : _auth = auth,
        _firestore = firestore,
        _googleSignIn = googleSignIn;

  CollectionReference get _users =>
      _firestore.collection("user");

  Stream<User?> get authStateChange => _auth.authStateChanges();

  FutureEither<UserModel> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final googleAuth = await googleUser?.authentication;
      final Credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
      UserCredential userCredential =
      await _auth.signInWithCredential(Credential);
      UserModel userModel;
      print("-------------------here-------------------");
      print(userCredential.user!.uid);
      print(userCredential.user!.displayName );
      print(userCredential.user!.email!);
      print(userCredential.user!.phoneNumber);
      print("userModel.password");
      if (userCredential.additionalUserInfo!.isNewUser) {
        userModel = UserModel(
          id: userCredential.user!.uid,
            name: userCredential.user!.displayName ?? 'NO Name',
           password: "",
            num: "",

            email: userCredential.user!.email!,);
        await _users.doc(userCredential.user!.uid).set(userModel.toMap());


      } else {
        userModel = await getUserData(userCredential.user!.uid).first;
        print("-------------------hereeeeeeeeeeeeee-------------------");
        print(userModel.id);
        print(userModel.email);
        print(userModel.name);
        print(userModel.num);
        print(userModel.password);
      }
      return right(userModel);
    } on FirebaseException catch (e) {
      throw e.message!;
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  Stream<UserModel> getUserData(String uid) {
    return _users.doc(uid).snapshots().map(
            (event) => UserModel.fromMap(event.data() as Map<String, dynamic>));
  }
  FutureEither<UserModel> getAgentlogin(
      {required String email, required String pass}) async {
    UserModel? agentModel;
    try {
      final agent = await _firestore
          .collection("user")
          .where("email", isEqualTo: email)
          .where("password", isEqualTo: pass)
          .get();
      if (agent.docs.isNotEmpty) {
        agentModel = UserModel.fromMap(agent.docs[0].data());
      }
      return right(agentModel!);
    } on FirebaseException catch (e) {
      throw e.message!;
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
