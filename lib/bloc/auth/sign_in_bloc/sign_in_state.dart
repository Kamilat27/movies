part of 'sign_in_bloc.dart';

sealed class SignInState extends Equatable {
  const SignInState();

  @override
  List<Object?> get props => [];
}

final class SignInInitial extends SignInState{}

class SignInSuccess extends SignInState{}
class SignInFailure extends SignInState{
  String message;
  SignInFailure(this.message);
}
class SignInProcess extends SignInState{}

final class SignOutInitial extends SignInState{}

class SignOutSuccess extends SignInState{}
class SignOutFailure extends SignInState{
  String message;
  SignOutFailure(this.message);
}
class SignOutProcess extends SignInState{}