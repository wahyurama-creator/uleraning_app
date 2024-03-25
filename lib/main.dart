import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uleraning_app/core/presentation/common/utils/app_bloc_provider.dart';
import 'package:uleraning_app/core/presentation/common/values/colors.dart';
import 'package:uleraning_app/core/presentation/pages/application/application_page.dart';
import 'package:uleraning_app/core/presentation/pages/register/register_page.dart';
import 'package:uleraning_app/core/presentation/pages/sign_in/sign_in_page.dart';
import 'package:uleraning_app/core/presentation/pages/welcome/welcome_page.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyAbYcLAVXCfw-oQZu35dXqSMx7CyNzbQv0',
      appId: '1:25940042899:android:65e234582c63ff13cb9966',
      messagingSenderId: '25940042899',
      projectId: 'ulearning-app-7941d',
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: AppBlocProviders.allBlocProviders,
      child: ScreenUtilInit(
        builder: (context, child) => MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme:
                ColorScheme.fromSeed(seedColor: Colors.lightBlueAccent),
            useMaterial3: true,
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.white,
              elevation: 0,
              iconTheme: IconThemeData(color: AppColors.primaryText),
            ),
          ),
          routes: {
            '/': (context) => const WelcomePage(),
            '/sign-in': (context) => const SignInPage(),
            '/register': (context) => const RegisterPage(),
            '/application': (context) => const ApplicationPage(),
          },
        ),
      ),
    );
  }
}
