import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uleraning_app/core/presentation/common/values/colors.dart';
import 'package:uleraning_app/core/presentation/pages/register/bloc/register_bloc.dart';
import 'package:uleraning_app/core/presentation/pages/register/controller/register_controller.dart';
import 'package:uleraning_app/core/presentation/pages/sign_in/widgets/sign_in_widgets.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: buildAppBar(title: 'Register'),
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              children: [
                SizedBox(
                  height: 16.h,
                ),
                Text(
                  'Enter your details below & free sign up',
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
                      'Username',
                      style: TextStyle(
                        color: Colors.grey.withOpacity(0.5),
                        fontSize: 14.sp,
                      ),
                    ),
                    SizedBox(height: 5.h),
                    buildTextField(
                      'Enter your username',
                      TextInputType.name,
                      'user',
                      (value) => context.read<RegisterBloc>().add(
                            UsernameEvent(value),
                          ),
                    ),
                    Text(
                      'Email',
                      style: TextStyle(
                        color: Colors.grey.withOpacity(0.5),
                        fontSize: 14.sp,
                      ),
                    ),
                    SizedBox(height: 5.h),
                    buildTextField(
                      'Enter your email address',
                      TextInputType.emailAddress,
                      'user',
                      (value) => context.read<RegisterBloc>().add(
                            EmailEvent(value),
                          ),
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
                      'Enter your password',
                      TextInputType.visiblePassword,
                      'lock',
                      (value) => context.read<RegisterBloc>().add(
                            PasswordEvent(value),
                          ),
                    ),
                    Text(
                      'Confirm Password',
                      style: TextStyle(
                        color: Colors.grey.withOpacity(0.5),
                        fontSize: 14.sp,
                      ),
                    ),
                    SizedBox(height: 5.h),
                    buildTextField(
                      'Enter your confirmation password',
                      TextInputType.visiblePassword,
                      'lock',
                      (value) => context.read<RegisterBloc>().add(
                            ConfirmPasswordEvent(value),
                          ),
                    ),
                    Text(
                      'By creating an account you have to agree with our terms & conditions',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: AppColors.primaryThreeElementText,
                      ),
                    ),
                    buildLogInAndRegisterButton(
                      'Sign Up',
                      'login',
                      () {
                        RegisterController(context).handleEmailRegister();
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
