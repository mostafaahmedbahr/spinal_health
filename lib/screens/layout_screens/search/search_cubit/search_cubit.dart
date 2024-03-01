import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spinal_health/screens/layout_screens/search/search_cubit/search_states.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit() : super(SearchInitState());

  static SearchCubit get(context) => BlocProvider.of(context);

  static List<String> allNames = [
    "mostafa",
    "aya",
    "asmaa",
    "bahr",
    "nada",
    "esraa",
    "reham",
    "kareem",
  ];



  List<String> names = List.from(allNames);

  void filterNames(String query) {
    if (query.isEmpty) {
      names = List.from(allNames);
    } else {
      names = allNames.where((name) => name.toLowerCase().contains(query.toLowerCase())).toList();
    }
    emit(SearchLoaded());
  }
}