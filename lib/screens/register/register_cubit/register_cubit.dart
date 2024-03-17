import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spinal_health/core/new_toast/new_toast.dart';
import 'package:spinal_health/lang/locale_keys.dart';
 import 'package:spinal_health/screens/register/register_cubit/register_states.dart';
import 'package:uuid/uuid.dart';

import '../../../dio/sh/sh.dart';
import '../../../models/user_model.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitState());

  static RegisterCubit get(context) => BlocProvider.of(context);


void register({
  required String name,
  required String email,
  required String phone,
  required String password,
  required BuildContext context,
}) async
{
  emit(RegisterLoadingState());
  FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: email,
    password: password,
  ).then((value) {
    createUsers(
      email: email,
      img: "",
      name: name,
      phone: phone,
      uid: "${value.user?.uid}",
    );
    SharedPreferencesHelper.saveData(key: "userId", value: value.user?.uid);
    emit(RegisterSuccessState());
    NewToast.showNewSuccessToast(msg: LocaleKeys.registerIsSuccess.tr(), context: context);
  }).catchError((error) {
    emit(RegisterErrorState(error: error.toString()));
    log("error in register ${error.toString()}");
    NewToast.showNewErrorToast(msg: "$error", context: context);
  });
}

  var uuid = const Uuid().v4();
  var userUuid = const Uuid().v4();
  final auth = FirebaseAuth.instance;


  void createUsers({
    required String name,
    required String phone,
    required String email,
    required String uid,
    required String img,
  }) async
  {
    emit(CreateUserLoadingState());
    UserModel userModel = UserModel(uid: uid,
        phone: phone,
        email: email,
        name: name,
        img: img,
        bio: '');
    FirebaseFirestore.instance.collection("users").doc(uid).set(
        userModel.toMap()).then((value) {
      emit(CreateUserSuccessState());
      log("***************");
    }).catchError((error) {
      emit(CreateUserErrorState(error: error.toString()));
      log("error in create user ${error.toString()}");
    });
  }



  var passCon = TextEditingController();
  var emailCon = TextEditingController();
  var mobileCon = TextEditingController();
  var nameCon = TextEditingController();
  var addressCon = TextEditingController();

  bool isVisible = true;

  void changeSuffixIcon() {
    isVisible = !isVisible;
    emit(ChangeSuffixIconState());
  }


  File? file;
  Future uploadOnlyImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowedExtensions: ["jpg", "png", "jpeg"],
      type: FileType.custom,
    );
    file = File(result?.files.single.path ?? "");
    debugPrint("---------- uplod is done ------------");
    emit(UploadImageSuccessState());
  }


}