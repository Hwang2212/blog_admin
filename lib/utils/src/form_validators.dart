class FormValidators {
  static String? validateName(String? value) {
    if (!value!.contains(RegExp(r'\w+'))) {
      return 'Enter Valid Name';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value!.isEmpty) {
      return "Please Enter Password";
    }
    if (!value.contains(RegExp(
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$'))) {
      return 'Password must contain 1 Capitalcase Letter, 1 Lowercase Letter, 1 Number & 1 Special Characters';
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

  static String? validateMemberIsEmpty(String? value) {
    if (value == null) {
      return "Select User's Membership";
    }
    return null;
  }

  static String? validateLabelIsEmpty(String? value) {
    if (value == null) {
      return "Select Post's Label";
    }
    return null;
  }

  static String? validateCategoryIsEmpty(String? value) {
    if (value == null) {
      return "Post's Category is required";
    }
    return null;
  }
}
