part of 'welcome_bloc.dart';

sealed class WelcomeState extends Equatable {
  const WelcomeState();
}

final class WelcomeInitial extends WelcomeState {
  @override
  List<Object> get props => [];
}
