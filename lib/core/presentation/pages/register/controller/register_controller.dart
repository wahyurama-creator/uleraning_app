import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uleraning_app/core/presentation/pages/register/bloc/register_bloc.dart';
import 'package:uleraning_app/core/presentation/widgets/toast_widget.dart';

class RegisterController {
  final BuildContext context;

  const RegisterController(this.context);

  void handleEmailRegister() async {
    final state = context.read<RegisterBloc>().state;
    String username = state.username;
    String email = state.email;
    String password = state.password;
    String confirmPassword = state.confirmPassword;

    if (username.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty) {
      toastInfo(message: 'All fields are required');
      return;
    }

    if (password != confirmPassword) {
      toastInfo(message: 'Password and confirm password must be the same');
      return;
    }

    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (credential.user != null) {
        await credential.user?.sendEmailVerification();
        await credential.user?.updateDisplayName(username);

        toastInfo(message: 'Please verify your email');

        if (context.mounted) {
          Navigator.of(context).pop();
        }
      }

    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        toastInfo(message: 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        toastInfo(message: 'The account already exists for that email.');
      } else if (e.code == 'invalid-email') {
        toastInfo(message: 'The email address is not valid.');
      }
    }
  }
}
