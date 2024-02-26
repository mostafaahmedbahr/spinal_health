// import 'package:dio/dio.dart';
// import 'package:flutter/cupertino.dart';
//
// import '../toast/toast.dart';
// import '../toast/toast_states.dart';
//
// class Errors
// {
//   static void handleError(DioError error) {
//     if (error.response?.statusCode == 404 ||
//         error.response?.statusCode == 403 ||
//         error.response?.statusCode == 419 ||
//         error.response?.statusCode == 400 ||
//         error.response?.statusCode == 500) {
//       final data = error.response?.data;
//       final message = data['message'];
//       // final errors = Map<String, List<String>>.from(data['errors']);
//       ToastConfig.showToast(
//         msg: "$message",
//         toastStates: ToastStates.Error,
//       );
//     }
//     debugPrint("error handleLoginError" * 10);
//   }
// }