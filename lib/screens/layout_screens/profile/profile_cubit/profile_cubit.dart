import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spinal_health/screens/layout_screens/profile/profile_cubit/profile_states.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit() : super(ProfileInitState());

  static ProfileCubit get(context) => BlocProvider.of(context);

  var nameCon = TextEditingController();
  var emailCon = TextEditingController();
  var phoneCon = TextEditingController();
  var addressCon = TextEditingController();

  String? img;


  Future<DocumentSnapshot<Map<String, dynamic>>> getUserById(String userId) async {
    try {
      // الحصول على مرجع لمستخدم معين باستخدام معرفه
      DocumentSnapshot<Map<String, dynamic>> userSnapshot = await FirebaseFirestore.instance.collection('users').doc(userId).get();

      // التأكد من أن الوثيقة موجودة وأنها ليست فارغة
      if (userSnapshot.exists && userSnapshot.data() != null) {
        // إرجاع بيانات المستخدم
        return userSnapshot;
      } else {
        // إذا كان المستخدم غير موجود أو الوثيقة فارغة، يمكنك إما إرجاع قيمة فارغة أو رفع استثناء حسب متطلبات التطبيق.
        // هنا، سنقوم بإرجاع القيمة فارغة.
        return Future.value(null);
      }
    } catch (error) {
      // في حالة حدوث خطأ، يمكنك إما إرجاع قيمة فارغة أو رفع استثناء حسب متطلبات التطبيق.
      // هنا، سنقوم بإرجاع القيمة فارغة.
      return Future.value(null);
    }
  }
}