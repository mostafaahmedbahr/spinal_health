
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spinal_health/models/slider_image_model.dart';
import 'package:spinal_health/models/types_model.dart';
import 'home_states.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitState());

  static HomeCubit get(context) => BlocProvider.of(context);


  List<SliderImageModel> sliderImagesList = [];

  Future<void> getSliderImagesData() async {
    emit(GetSliderImagesLoadingState());
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('sliders').get();
    FirebaseFirestore.instance.collection("sliders").get().then((value) {
      sliderImagesList = querySnapshot.docs.map((doc) => SliderImageModel.fromMap(doc.data() as Map<String, dynamic>)).toList();
      print(sliderImagesList);
      emit(GetSliderImagesSuccessState());
    }).catchError((error) {
      print("error in get slider images data ${error.toString()}");
      emit(GetSliderImagesErrorState());
    });
  }


  List<TypesModel> typesList = [];

  Future<void> getTypesData() async {
    emit(GetTypesLoadingState());
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('types').get();
    FirebaseFirestore.instance.collection("types").get().then((value) {
      typesList = querySnapshot.docs.map((doc) => TypesModel.fromMap(doc.data() as Map<String, dynamic>)).toList();
      print(typesList);
      emit(GetTypesSuccessState());
    }).catchError((error) {
      print("error in get types data ${error.toString()}");
      emit(GetTypesErrorState());
    });
  }



}
