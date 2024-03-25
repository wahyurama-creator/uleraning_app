import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uleraning_app/core/presentation/common/values/colors.dart';
import 'package:uleraning_app/core/presentation/pages/welcome/bloc/welcome_bloc.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<WelcomeBloc, WelcomeState>(
        builder: (context, state) {
          return Container(
            margin: EdgeInsets.only(top: 34.h),
            width: 375.w,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                PageView(
                  controller: _pageController,
                  onPageChanged: (index) {
                    state.page = index;
                    context.read<WelcomeBloc>().add(const WelcomeEvent());
                  },
                  children: [
                    _buildPage(
                      context: context,
                      index: 0,
                      title: 'First See Learning',
                      description:
                          'Forget about a for people all knowledge in one learning!',
                      image: 'assets/images/reading.png',
                      buttonText: 'Next',
                    ),
                    _buildPage(
                      context: context,
                      index: 1,
                      title: 'Connect With Everyone',
                      description:
                          'Always keep in touch with your tutor & friend. Let\'s get connected',
                      image: 'assets/images/boy.png',
                      buttonText: 'Next',
                    ),
                    _buildPage(
                      context: context,
                      index: 2,
                      title: 'Always Fascinated Learning',
                      description:
                          'Learn from anywhere, anytime. All you need is a device and internet connection',
                      image: 'assets/images/man.png',
                      buttonText: 'Get Started',
                    ),
                  ],
                ),
                Positioned(
                  bottom: 100.h,
                  child: DotsIndicator(
                    position: state.page,
                    dotsCount: 3,
                    mainAxisAlignment: MainAxisAlignment.center,
                    decorator: DotsDecorator(
                      color: AppColors.primaryFourElementText,
                      activeColor: AppColors.primaryElement,
                      activeSize: Size(20.w, 6.h),
                      activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                      spacing: EdgeInsets.all(2.w),
                    ),
                    onTap: (index) {
                      _pageController.animateToPage(
                        index,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildPage(
      {required BuildContext context,
      required int index,
      required String title,
      required String description,
      required String image,
      required String buttonText}) {
    return Column(
      children: [
        SizedBox(
          width: 345.w,
          height: 345.w,
          child: Image.asset(
            image,
            fit: BoxFit.cover,
          ),
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryText,
          ),
        ),
        Container(
          width: 375.w,
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Text(
            description,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.normal,
              color: AppColors.primarySecondaryElementText,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        GestureDetector(
          onTap: () {
            if (index == 2) {
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/sign-in',
                (route) => false,
              );
            } else {
              _pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeIn,
              );
            }
          },
          child: Container(
            width: 325.w,
            height: 45.h,
            margin: EdgeInsets.only(top: 100.h, left: 25.w, right: 25.w),
            decoration: BoxDecoration(
              color: AppColors.primaryElement,
              borderRadius: BorderRadius.circular(15.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: Center(
              child: Text(
                buttonText,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
