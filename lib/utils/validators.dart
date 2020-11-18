class Validations {

  String validateEmail(String value) {
    String _msg;
    RegExp regex = new RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    if (value.isEmpty) {
      _msg = "Email is required";
    } else if (!regex.hasMatch(value)) {
      _msg = "Please provide a valid email address";
    }
    return _msg;
  }

  String validatePassword(String value){
    String _msg;
    if (value.isEmpty) {
      _msg = "Password is required";
    } else if (value.length<6) {
      _msg = "Password more than 6 characters";
    }
    return _msg;
  }

  String validateConfirmPassword(String confirmPassword,String password ){
    String _msg;
    if (confirmPassword.isEmpty) {
      _msg = "Password is required";
    } else if (confirmPassword.length < 6) {
      _msg = "Password more than 6 characters";
    }
    // else if ( password != confirmPassword ) {
    //   print(password);
    //   print(confirmPassword);
    //   _msg = "Passwords are not matched";
    // }
    return _msg;
  }

    String validateName(String value){
    String _msg;
    if (value.isEmpty) {
      _msg = "Name is required";
    }
    return _msg;
  }

}
