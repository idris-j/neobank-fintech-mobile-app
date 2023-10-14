class ApiRoutes {
  static const String local = 'http://localhost:8000';

  //base route
  static const String base = '$local/api';

  //AUthentication
  static const String login = '$base/merchant/login-merchant';
  static const String signup = '$base/merchant/register-merchant';
  static const String createPin = '$base/merchant/create-merchant-pin';
  static const String validatePin = '$base/merchant/validate-merchant-pin';
  static const String sendOtp = '$base/merchant/send-otp';
  static const String validateOtp = '$base/merchant/validate-otp';

  //user data
  static const String fetchMerchantProfile =
      '$base/merchant/fetch-merchant-profile';

  // payment 
  static const String generatePaymentLink = '$base/merchant/initiate-bank-direct-charge';

}
