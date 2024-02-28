 import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../models/general_model.dart';


part 'contact_us_state.dart';

class ContactUsCubit extends Cubit<ContactUsStates> {
  ContactUsCubit() : super(ContactUsInitial());

  static ContactUsCubit get(context) => BlocProvider.of(context);


  var nameCon = TextEditingController();
  var phoneCon = TextEditingController();
  var messageCon = TextEditingController();
  var emailCon = TextEditingController();

//   GeneralModel? contactUsModel;
//   contactUs({
//     required String name,
//     required String message,
//     required String mobile,
//     required String email,
// })
//   {
//     emit(ContactUsLoadingState());
//     DioHelper.postData(
//         url: AppUrl.contactUsUrl,
//       data: {
//         'name': name,
//         'mobile': mobile,
//         'type_contact': '5',
//         'details': message,
//         'email': email,
//       },
//     ).then((value){
//
//       contactUsModel = GeneralModel.fromJson(value.data);
//       debugPrint("mostafa contact Us done");
//       emit(ContactUsSuccessState(contactUsModel));
//     }).catchError((error){
//       debugPrint(error.toString());
//       emit(ContactUsErrorState());
//     });
//   }



}
