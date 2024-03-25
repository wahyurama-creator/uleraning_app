import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

toastInfo({
  required String message,
  Color backgroundColor = Colors.black,
  Color textColor = Colors.white,
}) =>
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: backgroundColor,
      textColor: textColor,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 2,
      fontSize: 16.sp,
    );
