

String? validateEmail(String email) {
  // Regular expression for a valid email address
  final RegExp emailRegex = RegExp(
    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
    caseSensitive: false,
    multiLine: false,
  );
  if(email.isEmpty){
    return null;
  }
  if(emailRegex.hasMatch(email)==false){
    return "Invalid Email Address";
  }

  return null;
}

String? validatePassword(String password){
  if(password.isEmpty){
    return null;
  }
  if(password.length<8){
    return "Password must be at least 8 characters long";
  }
  return null;
}