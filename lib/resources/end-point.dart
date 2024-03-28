// ignore_for_file: file_names

class EndPoints {
  // ignore: constant_identifier_names
  static const String BASE_URL = "https://predo-backend-a326e289b017.herokuapp.com";
  // static const String BASE_URL = "http://192.168.32.255:3000";
  static const String users = "/users";
  static const String projects = "/projects";
  static const String projectByIdUser = "/projects/get-by-user";
  static const String boards = "/boards";
  static const String tasks = "/tasks";
  static const String notifications = "/notifications";
  // Auth
  static const String signInWithEmail = '/auth/sign-in';
  static const String signInSocial = '/auth/sign-in-social';
  static const String signUpLocal = '/auth/sign-up';
  static const String sendOTP = '/auth/send-otp';
  static const String changePassword = '/users/update-password/phone';
  static const String signout = '/auth/sign-out';
}
