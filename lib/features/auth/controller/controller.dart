import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_corona/features/Home/homeScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Model/user.dart';
import '../../../core/utils.dart';
import '../repository/authRepository.dart';

final userProvider = StateProvider<UserModel?>((ref) => null);

final authControllerProvider = StateNotifierProvider<AuthController, bool>(
      (ref) => AuthController(
    auth_repository: ref.watch(authRepositoryProvider),
    ref: ref,
  ),
);

final authStateChangeProvider = StreamProvider((ref) {
  final authController = ref.watch(authControllerProvider.notifier);
  return authController.authStateChange;
});

final getUserDataProvider = StreamProvider.family((ref, String uid) {
  final authController = ref.watch(authControllerProvider.notifier);
  return authController.getUserData(uid);
});

class AuthController extends StateNotifier<bool> {
  final Auth_Repository _auth_repository;
  final Ref _ref;
  AuthController({required Auth_Repository auth_repository, required Ref ref})
      : _auth_repository = auth_repository,
        _ref = ref,
        super(false);

  Stream<User?> get authStateChange => _auth_repository.authStateChange;

  void signInWithGoogle(BuildContext context) async {
    state = true;
    final user = await _auth_repository.signInWithGoogle();
    state = false;
    user.fold(
          (l) => showSnackBar(context, "l.message"),
          (userModel)
         async {
           _ref.read(userProvider.notifier).update((state) => userModel);
           final SharedPreferences prefs=await SharedPreferences .getInstance();
           prefs.setString("key", userModel.id);
           Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
         }
    );
  }

  Stream<UserModel> getUserData(String uid) {
    return _auth_repository.getUserData(uid);
  }

  getAgentlogin(
      {required String email,
        required String pass,
        required BuildContext context}) async {
    state = true;
    final res = await  _auth_repository.getAgentlogin(email: email, pass: pass);
    state = false;
    res.fold((l) => showSnackBar(context, l.message), (r) async {
      _ref.read(userProvider.notifier).update((state) => r);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("key", r.id);
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ));
      showSnackBar(context, "Login Successfully...!");
    });
  }
}