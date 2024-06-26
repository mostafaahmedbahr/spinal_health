import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spinal_health/core/new_toast/new_toast.dart';
import 'package:spinal_health/lang/locale_keys.dart';
 import 'package:spinal_health/screens/register/register_cubit/register_states.dart';
import 'package:uuid/uuid.dart';

import '../../../dio/sh/sh.dart';
import '../../../models/user_model.dart';
import '../../layout_screens/profile/profile_cubit/profile_cubit.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitState());

  static RegisterCubit get(context) => BlocProvider.of(context);


void register({
  required String name,
  required String email,
  required String phone,
  required String password,
  required String userType,
  required String imageUrl,
  required String address,
  required BuildContext context,
}) async
{
  emit(RegisterLoadingState());
  FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: email,
    password: password,
  ).then((value) {
    createUsers(
      address: address,
      email: email,
      img: imageUrl,
      userType: userType,
      name: name,
      phone: phone,
      uid: "${value.user?.uid}",
    );
    SharedPreferencesHelper.saveData(key: "userId", value: value.user?.uid);
    emit(RegisterSuccessState());
    ProfileCubit.get(context).getUserById(value.user!.uid);
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
    required String userType,
    required String address,
  }) async
  {
    emit(CreateUserLoadingState());
    UserModel userModel = UserModel(uid: uid,
        phone: phone,
        email: email,
        address: address,
        name: name,
        img: img,
        userType: userType,
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
    uploadImageToFirebase();
    emit(UploadImageSuccessState());
  }

  String? imageUrl;
  Future<void> uploadImageToFirebase() async {
    if (file == null) return;
    try {
      final Reference storageReference = FirebaseStorage.instance.ref().child('users_images/${DateTime.now()}.jpg');
      final UploadTask uploadTask = storageReference.putFile(file!);
      final TaskSnapshot snapshot = await uploadTask.whenComplete(() => null);
      final String downloadUrl = await snapshot.ref.getDownloadURL();
      imageUrl = downloadUrl;
      log(imageUrl!);
     emit(UploadImageToFireStorageSuccessState());
    } catch (error) {
      log('Error uploading image: $error');
    }
  }

  String? userType;
  final List<String> userTypesList = [
    'Doctor',
    'Patient',
  ];


}