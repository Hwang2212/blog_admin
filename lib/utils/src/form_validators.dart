class FormValidators {
  static String? validateName(String? value) {
    if (!value!.contains(RegExp(r'\w+'))) {
      return 'Enter Valid Name';
    }
    return null;
  }


  static String? validateEmail(String? value) {
    // if (email!.contains('@') && email.contains('.com')) {
    if (!value!.contains(RegExp(r'\w+@\w+\.\w+'))) {
      return 'Enter Valid Email';
    }
    return null;
  }
}
