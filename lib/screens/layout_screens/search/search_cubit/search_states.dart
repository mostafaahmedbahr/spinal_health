abstract class SearchStates{}

class SearchInitState extends SearchStates{}

class SearchLoaded extends SearchStates{}

class GetAllPatientListLoadingState extends SearchStates{}
class GetAllPatientListSuccessState extends SearchStates{}
class GetAllPatientListErrorState extends SearchStates{}