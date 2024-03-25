
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uleraning_app/core/presentation/pages/sign_in/bloc/sign_in_bloc.dart';
import 'package:uleraning_app/core/presentation/pages/sign_in/widgets/sign_in_widgets.dart';

import 'controller/sign_in_controller.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: buildAppBar(title: 'Log In'),
          body: SingleChildScrollView(
            child: Column(
              children: [
                buildThirdPartyLogin(() => {}),
                Text(
                  'Or use  your email account to login',
                  style: TextStyle(
                    color: Colors.grey.withOpacity(0.5),
                    fontSize: 14.sp,
                  ),
                ),
                SizedBox(
                  height: 46.h,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Email',
                      style: TextStyle(
                        color: Colors.grey.withOpacity(0.5),
                        fontSize: 14.sp,
                      ),
                    ),
                    SizedBox(height: 5.h),
                    buildTextField(
                      'Email Address',
                      TextInputType.emailAddress,
                      'user',
                      (value) =>
                          context.read<SignInBloc>().add(EmailEvent(value)),
                    ),
                    Text(
                      'Password',
                      style: TextStyle(
                        color: Colors.grey.withOpacity(0.5),
                        fontSize: 14.sp,
                      ),
                    ),
                    SizedBox(height: 5.h),
                    buildTextField(
                      'Password',
                      TextInputType.visiblePassword,
                      'lock',
                      (value) =>
                          context.read<SignInBloc>().add(PasswordEvent(value)),
                    ),
                    buildForgotPassword(),
                    buildLogInAndRegisterButton(
                      'Log In',
                      'login',
                      () {
                        SignInController(context: context)
                            .handleSignIn('email');
                      },
                    ),
                    buildLogInAndRegisterButton(
                      'Register',
                      'register',
                      () {
                        Navigator.pushNamed(context, '/register');
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
