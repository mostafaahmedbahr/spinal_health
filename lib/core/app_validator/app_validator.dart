class MyValidators {
  static String? displayNameValidator(String? displayName) {
    if (displayName == null || displayName.isEmpty) {
      return 'الحقل مطلوب';
    }
    if (displayName.length < 3) {
      return 'عدد الحروف يجب ان يكون اكبر من ٣ حروف';
    }

    return null; // Return null if display name is valid
  }

  static String? emailValidator(String? value) {
    if (value!.isEmpty) {
      return 'يرجي ادخال البريد الالكتروني';
    }
    if (!RegExp(r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b')
        .hasMatch(value)) {
      return 'يرجي ادخال بريد الكتروني صالح';
    }
    return null;
  }

  static String? passwordValidator(String? value) {
    if (value!.isEmpty) {
      return 'كلمة المرور مطلوبه';
    }
    if (value.length < 8) {
      return 'كلمة المرور يجب الا تقل عن 8 احرف';
    }
    return null;
  }

  static String? urlValidator(String? value,{bool isRequired=false}) {
    String pattern =
        r'(http|https)://[\w-]+(\.[\w-]+)+([\w.,@?^=%&amp;:/~+#-]*[\w@?^=%&amp;/~+#-])?';
    RegExp regExp = RegExp(pattern);
    if(isRequired){
      if (value?.isEmpty ?? true) {
        return 'يرجى ادخال رابط صحيح';
      }
    }

    if (value?.isEmpty ?? true) {
      return null;
    } else if (!regExp.hasMatch(value!)) {
      return 'يرجى ادخال رابط صحيح';
    }
    return null;
  }

  static String? repeatPasswordValidator({String? value, String? password}) {
    if (value != password) {
      return 'كبمة المرورغير متطابقه';
    }
    return null;
  }

  static String? phoneValidator(String? value) {
    if (value!.isEmpty) {
      return 'Please enter a phone number';
    }
    if (value.length < 6) {
      return 'phone number must be at least 11 numbers long';
    }
    return null;
  }
}