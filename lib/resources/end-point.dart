// ignore_for_file: file_names

class EndPoints {
  // ignore: constant_identifier_names
  // static const String BASE_URL = "https://predo-backend-a326e289b017.herokuapp.com";
  static const String BASE_URL = "http://172.25.150.187:3000";
  static const String users = "";

  static const String project = "/projects";
  // Auth
  static const String signInWithEmail = '/auth/sign-in';
  static const String signInSocial = '/auth/sign-in-social';
  static const String signUpLocal = '/auth/signup-local';
  static const String sendOTP = '/otps/send-otp-phone';
  static const String changePassword = '/users/update-password/phone';
}
