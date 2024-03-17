 import 'package:cloud_firestore/cloud_firestore.dart';
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





  Future<void> sendMessageToFirebase({
    required String name,
    required String message,
    required String mobile,
    required String email,
}) async {
    emit(ContactUsLoadingState());
    try {
      // ارسال الرسالة إلى مجموعة بيانات Firestore
      await FirebaseFirestore.instance.collection('contactUsMessages').add({
        'name': name,
        'email': email,
        'message': message,
        'phone': mobile,
        'timestamp': FieldValue.serverTimestamp(), // تخزين الوقت الحالي
      });
      emit(ContactUsSuccessState());
      nameCon.text = " ";
      emailCon.text = " ";
      phoneCon.text = " ";
      messageCon.text = " ";
      print('تم إرسال الرسالة بنجاح');
    } catch (error) {
      emit(ContactUsErrorState());
      print('حدث خطأ أثناء إرسال الرسالة: $error');
    }
  }


}
