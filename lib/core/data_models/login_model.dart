class LoginModel {
  final String email;
  final String password;

  LoginModel({required this.email, required this.password});

  get data => null;

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}
