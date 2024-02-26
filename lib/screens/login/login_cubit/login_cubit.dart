 import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

 import 'login_states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitState());

  static LoginCubit get(context) => BlocProvider.of(context);

  var passCon = TextEditingController();
  var emailCon = TextEditingController();
  var mobileCon = TextEditingController();

  bool isVisible = true;

  void changeSuffixIcon() {
    isVisible = !isVisible;
    emit(ChangeSuffixIconState());
  }


}
