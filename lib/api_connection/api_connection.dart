class API {
  static const host = "10.29.51.216";
  static const hostConnect = "http://$host/api_miftahprint";
  static const hostConnectUser = "$hostConnect/user";
  
  static const signUp = "$hostConnectUser/signup.php";
  static const validatEmail = "$hostConnectUser/validate_email.php";
}