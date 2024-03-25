import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uleraning_app/core/presentation/pages/register/bloc/register_bloc.dart';
import 'package:uleraning_app/core/presentation/pages/sign_in/bloc/sign_in_bloc.dart';
import 'package:uleraning_app/core/presentation/pages/welcome/bloc/welcome_bloc.dart';

class AppBlocProviders {
  static get allBlocProviders => [
        BlocProvider(
          create: (context) => WelcomeBloc(),
        ),
        BlocProvider(
          create: (context) => SignInBloc(),
        ),
        BlocProvider(
          create: (context) => RegisterBloc(),
        ),
      ];
}
