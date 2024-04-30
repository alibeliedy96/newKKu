

abstract class ValidatorsImp {
  static int maxNameLength = 30;
  static int minNameLength = 2;
  static int maxPasswordLength = 32;
  static int minPasswordLength = 6;



  // ---------------------- is arabic ----------------------
  static bool isArabic(String text) {
    RegExp arabic = RegExp(r'[\u0600-\u06FF]');
    var result = arabic.hasMatch(text);
    return result;
  }
  // ---------------------- email ----------------------
  static String? validateEmail(String? email) {
    if (email?.isEmpty ?? true) return "Email cannot be empty";

    // Check if the email matches a basic email pattern
    final RegExp emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if (!emailRegex.hasMatch(email!)) return "Enter a valid email address";

    return null; // Email is valid
  }

  // -------------------------- password --------------------------
  static String? validatePassword(String? password) {
    if (password?.isEmpty ?? true) {
      return "Password cannot be empty";
    }

    if (password!.length < minPasswordLength) {
      return 'Password should be at least $minPasswordLength characters long';
    }

    if (password.length > maxPasswordLength) {
      return 'Password should not exceed $maxPasswordLength characters';
    }


    return null;


    return null; // Password meets all criteria
  }


  static String? validateConfirmPassword(String? password, String? confirmPassword) {
    if (password?.isEmpty ?? true) {
      return "Password cannot be empty";
    }

    if (password!.length < minPasswordLength) {
      return 'Password should be at least $minPasswordLength characters long';
    }

    if (password.length > maxPasswordLength) {
      return 'Password should not exceed $maxPasswordLength characters';
    }

    if (confirmPassword != password) {
      return 'Passwords do not match';
    }

    return null; // Password meets all criteria
  }



  static String? validateName(String? firstName) {
    if (firstName?.isEmpty ?? true) {
      return "Name cannot be empty";
    }


    // Check if the string contains only letters
    final RegExp nameRegex = RegExp(r'^(?! +$)[a-zA-Z\u0600-\u06FF\s]+$');
    if (!nameRegex.hasMatch(firstName!)) {
      return "Name should contain only letters";
    }

    return null; // Name meets all criteria
  }


}
