part of 'check_login_cubit.dart';

@immutable
abstract class CheckLoginState {}

class CheckLoginInitial extends CheckLoginState {}

class CheckLoginIsLoading extends CheckLoginState {}

class CheckLoginIsSuccess extends CheckLoginState {}

class CheckLoginIsLoggedOut extends CheckLoginState {}

class CheckLoginIsFailed extends CheckLoginState {
  final String message;

  CheckLoginIsFailed(this.message);
}
