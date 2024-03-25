import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uleraning_app/core/presentation/common/values/colors.dart';

AppBar buildAppBar({required String title}) => AppBar(
      elevation: 0,
      centerTitle: true,
      title: Text(
        title,
        style: TextStyle(
          color: AppColors.primaryText,
          fontSize: 16.sp,
          fontWeight: FontWeight.normal,
        ),
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(1.h),
        child: Divider(
          color: Colors.grey.withOpacity(0.5),
        ),
      ),
    );

Widget buildThirdPartyLogin(Function() onTap) {
  return Container(
    margin: EdgeInsets.only(
      top: 40.h,
      bottom: 20.h,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _thirdPartyIcons('google', () => {}),
        _thirdPartyIcons('apple', () => {}),
        _thirdPartyIcons('facebook', () => {}),
      ],
    ),
  );
}

Widget _thirdPartyIcons(String icon, Function() onTap) => GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 40.w,
        width: 40.w,
        child: Image.asset('assets/icons/$icon.png'),
      ),
    );

Widget buildTextField(
    String hintText, TextInputType inputType, String iconName,
    Function(String)? onChanged) {
  return Container(
    width: 325.w,
    height: 50.h,
    margin: EdgeInsets.only(bottom: 20.h),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15.r),
      border: Border.all(color: AppColors.primaryFourElementText),
    ),
    child: Row(children: [
      Container(
        width: 16.w,
        height: 16.w,
        margin: EdgeInsets.only(left: 17.w),
        child: Image.asset('assets/icons/$iconName.png'),
      ),
      SizedBox(
        width: 270.w,
        height: 50.h,
        child: TextField(
          onChanged: (value) => onChanged!(value),
          keyboardType: TextInputType.multiline,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              color: AppColors.primarySecondaryElementText,
              fontSize: 13.sp,
            ),
            border: const OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
          ),
          style: TextStyle(
            color: AppColors.primaryText,
            fontFamily: 'Avenir',
            fontWeight: FontWeight.normal,
            fontSize: 14.sp,
          ),
          autofocus: false,
          obscureText:
              inputType == TextInputType.visiblePassword ? true : false,
        ),
      ),
    ]),
  );
}

Widget buildForgotPassword() {
  return SizedBox(
    width: 260.w,
    height: 44.h,
    child: GestureDetector(
      onTap: () {},
      child: Text(
        'Forgot Password?',
        style: TextStyle(
          color: AppColors.primaryText,
          decoration: TextDecoration.underline,
          decorationColor: AppColors.primaryText,
          fontSize: 14.sp,
        ),
      ),
    ),
  );
}

Widget buildLogInAndRegisterButton(String title, String buttonType, Function()? onTap) {
  return Container(
    width: 325.w,
    height: 50.h,
    margin: EdgeInsets.only(top: buttonType == 'login' ? 40.h : 20.h),
    child: ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonType == 'login'
            ? AppColors.primaryElement
            : AppColors.primaryBackground,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.r),
          side: buttonType != ' login'
              ? const BorderSide(color: AppColors.primaryFourElementText)
              : BorderSide.none,
        ),
        elevation: 0,
      ),
      child: Text(
        title,
        style: TextStyle(
          color: buttonType == 'login'
              ? AppColors.primaryBackground
              : AppColors.primaryText,
          fontSize: 16.sp,
          fontWeight: FontWeight.normal,
        ),
      ),
    ),
  );
}
