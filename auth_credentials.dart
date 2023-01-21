// 1
abstract class AuthCredentials {
  late final String email;
  late final String password;

  AuthCredentials({required this.email, required this.password});
}

// 2
class LoginCredentials extends AuthCredentials {
  LoginCredentials({required String email, required String password})
      : super(email: email, password: password);
}

// 3
class SignUpCredentials extends AuthCredentials {
  final String email;
  final String phonenumber;

  SignUpCredentials(
      {required this.phonenumber,
      required String password,
      required String confirmPassword,
      required this.email})
      : super(email: email, password: password);
}

class ForgetPassCredentials extends AuthCredentials {
  final String email;
  final String code;
  ForgetPassCredentials(
      {required this.email, required this.code, required String newPassword})
      : super(email: email, password: newPassword);
}

class RecoverEmailCredentials {
  final String email;
  RecoverEmailCredentials({required this.email});
}
