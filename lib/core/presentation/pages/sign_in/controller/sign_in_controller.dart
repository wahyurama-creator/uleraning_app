import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uleraning_app/core/presentation/pages/sign_in/bloc/sign_in_bloc.dart';
import 'package:uleraning_app/core/presentation/widgets/toast_widget.dart';

class SignInController {
  final BuildContext context;

  const SignInController({
    required this.context,
  });

  void handleSignIn(String type) async {
    // Handle sign in
    if (type == 'email') {
      // Handle email sign in
      final state = context.read<SignInBloc>().state;
      final emailAddress = state.email;
      final password = state.password;

      if (emailAddress.isEmpty) {
        toastInfo(message: 'Email address is required');
      }
      if (password.isEmpty) {
        toastInfo(message: 'Password is required');
      }

      // Handle sign in
      try {
        final userCredential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailAddress,
          password: password,
        );

        if (userCredential.user == null) {
          // Handle sign in failure
          toastInfo(message: 'User is not exist');
        }
        if (!userCredential.user!.emailVerified) {
          // Handle email not verified
          toastInfo(message: 'Email is not verified');
        }

        final user = userCredential.user;
        if (user != null) {
          // Handle sign in success
          toastInfo(message: 'Sign in success');
          Navigator.of(context).pushNamedAndRemoveUntil(
            '/application',
            (route) => false,
          );
        } else {
          // Handle sign in failure
          toastInfo(message: 'Sign in failure');
        }
      } on FirebaseAuthException catch (e) {
        // Handle sign in failure
        if (e.code == 'user-not-found') {
          log('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          log('Wrong password provided for that user.');
        } else if (e.code == 'invalid-email') {
          log('Invalid email provided.');
        } else {
          log('Error: ${e.code}');
        }
      }
    } else if (type == 'google') {
      // Handle Google sign in
    } else if (type == 'facebook') {
      // Handle Facebook sign in
    }
  }
}
