class API {
  static const host = "192.168.0.103";
  static const hostConnect = "http://$host/api_miftahprint";
  static const hostConnectUser = "$hostConnect/user";
  
  static const signUp = "$hostConnectUser/signup.php";
  static const validateEmail = "$hostConnectUser/validate_email.php";
}