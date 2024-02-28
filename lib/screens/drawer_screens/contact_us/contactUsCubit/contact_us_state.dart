part of 'contact_us_cubit.dart';

@immutable
abstract class ContactUsStates {}

class ContactUsInitial extends ContactUsStates {}

class ContactUsLoadingState extends ContactUsStates {}
class ContactUsErrorState extends ContactUsStates {}

//ignore: must_be_immutable
class ContactUsSuccessState extends ContactUsStates {
  GeneralModel? contactUsModel;
  ContactUsSuccessState(this.contactUsModel);
}





