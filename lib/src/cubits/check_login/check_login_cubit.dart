import 'package:belajar_flutter/src/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'check_login_state.dart';

class CheckLoginCubit extends Cubit<CheckLoginState> {
  CheckLoginCubit() : super(CheckLoginInitial());

  void checkLogin() async {
    final result = await UserService().checkLogin();
    if (result.data != null) {
      emit(CheckLoginIsSuccess());
    } else {
      emit(CheckLoginIsFailed(result.message));
    }
  }

  void logout() async {
    final result = await UserService().logout();
    if (result.data == null) {
      emit(CheckLoginIsLoggedOut());
    } else {
      emit(CheckLoginIsSuccess());
    }
  }
}
