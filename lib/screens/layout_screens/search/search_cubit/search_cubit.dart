import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spinal_health/screens/layout_screens/search/search_cubit/search_states.dart';

import '../../../../models/all_patient_model.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit() : super(SearchInitState());

  static SearchCubit get(context) => BlocProvider.of(context);

  // static List<String> allNames = [
  //   "mostafa",
  //   "aya",
  //   "asmaa",
  //   "bahr",
  //   "nada",
  //   "esraa",
  //   "reham",
  //   "kareem",
  // ];


  //
  // List<String> names = List.from(allNames);
  //
  // void filterNames(String query) {
  //   if (query.isEmpty) {
  //     names = List.from(allNames);
  //   } else {
  //     names = allNames.where((name) => name.toLowerCase().contains(query.toLowerCase())).toList();
  //   }
  //   emit(SearchLoaded());
  // }

  List<AllPatientModel> patientsListSearchResults = [];
  void searchPatients(String query) {
    if (query.isEmpty) {
      patientsListSearchResults = List.from(patientsList);
    }
    else {
      patientsListSearchResults = patientsList.where((name) => name.name.toLowerCase().contains(query.toLowerCase())).toList();
      //   for (var patient in patientsList) {
      //   if (patient.name.toLowerCase().contains(query.toLowerCase())) {
      //     patientsListSearchResults.add(
      //         patient); // إضافة العنصر إلى قائمة النتائج إذا تطابق مع معايير البحث
      //   }
      // }
    }
    emit(SearchLoaded());
    // بعد الانتهاء من عملية البحث، يمكنك تحديث واجهة المستخدم أو عرض النتائج كما تريد
    // يمكنك استخدام الحالة الحالية لإعادة بناء واجهة المستخدم
    // setState(() {});
  }


  List<AllPatientModel> patientsList = [];

  Future<void> getAllPatientData() async {
    emit(GetAllPatientListLoadingState());
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('patients').get();
    FirebaseFirestore.instance.collection("patients").get().then((value) {
      patientsList = querySnapshot.docs.map((doc) => AllPatientModel.fromMap(doc.data() as Map<String, dynamic>)).toList();
      print(patientsList);
      emit(GetAllPatientListSuccessState());
    }).catchError((error) {
      print("error in get all patient data ${error.toString()}");
      emit(GetAllPatientListErrorState());
    });
  }

}