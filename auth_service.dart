import 'dart:async';

import 'package:amplify_flutter/amplify_flutter.dart';

import 'auth_credentials.dart';

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';

// 1
enum AuthFlowStatus {
  login,
  signUp,
  verification,
  session,
  forgetpass,
  loginFailed,

  recoveremail
}

// 2
class AuthState {
  final AuthFlowStatus? authFlowStatus;

  AuthState({this.authFlowStatus});
}

// 3
class AuthService {
  // 4
  final authStateController = StreamController<AuthState>();
  late AuthCredentials _credentials;

  // 5
  void showSignUp() {
    final state = AuthState(authFlowStatus: AuthFlowStatus.signUp);
    authStateController.add(state);
  }

  void showSession() {
    final state = AuthState(authFlowStatus: AuthFlowStatus.session);
    authStateController.add(state);
  }

  void showRecoverEmail() {
    final state = AuthState(authFlowStatus: AuthFlowStatus.recoveremail);
    authStateController.add(state);
  }
  // void showMap() {
  //   final state = AuthState(authFlowStatus: AuthFlowStatus.map);
  //   authStateController.add(state);
  //   print('converted to state map');
  // }

  // 6
  void showLogin() {
    final state = AuthState(authFlowStatus: AuthFlowStatus.login);
    authStateController.add(state);
  }

  void showVerification() {
    final state = AuthState(authFlowStatus: AuthFlowStatus.verification);
    authStateController.add(state);
  }

  // 1
  void loginWithCredentials(AuthCredentials credentials) async {
    try {
      final checkSession = await Amplify.Auth.fetchAuthSession();
      // 2
      // Amplify.API.
      if (checkSession.isSignedIn) {
        final state = AuthState(authFlowStatus: AuthFlowStatus.session);
        authStateController.add(state);
        // print('session already EXIST');
      } else {
        final result = await Amplify.Auth.signIn(
            username: credentials.email, password: credentials.password);

        // 3
        if (result.isSignedIn) {
          final state = AuthState(authFlowStatus: AuthFlowStatus.session);
          authStateController.add(state);
        } else {
          // 4
          // print('User could not be signed in');
        }
      }
    } on AmplifyException catch (authError) {
      final state = AuthState(authFlowStatus: AuthFlowStatus.loginFailed);
      authStateController.add(state);

      print('Failed to logIn - ${authError.message}');
    }
  }

  // } Closing brace of loginWithCredentials (line 38)

// 1
// for signing up the user

  void signUpWithCredentials(SignUpCredentials credentials) async {
    try {
      // 2

      final userAttributes = <CognitoUserAttributeKey, String>{
        CognitoUserAttributeKey.email: credentials.email,
        CognitoUserAttributeKey.phoneNumber: credentials.phonenumber
      };

      final result = await Amplify.Auth.signUp(
          username: credentials.email,
          password: credentials.password,
          // );
          options: CognitoSignUpOptions(userAttributes: userAttributes));

      if (result.isSignUpComplete) {
        // 5
        this._credentials = credentials;
        // print("signup hogya");

        // 6
        final state = AuthState(authFlowStatus: AuthFlowStatus.verification);
        authStateController.add(state);
      }
      // 7
    } on AmplifyException catch (authError) {
      print('Failed to sign up - ${authError.message}');
    }
  }

  void verifyCode(String verificationCode) async {
    try {
      // 2
      final result = await Amplify.Auth.confirmSignUp(
          username: _credentials.email, confirmationCode: verificationCode);

      // 3
      if (result.isSignUpComplete) {
        //  loginWithCredentials(_credentials);
        final state = AuthState(authFlowStatus: AuthFlowStatus.login);
        authStateController.add(state);
        showLogin();
      } else {
        // 4
        // Follow more steps
      }
    } on AmplifyException catch (authError) {
      print('Failed to sign up and verify- ${authError.message}');
    }
  }

  // } Closing brace of verifyCode (line 96)

  void logOut() async {
    try {
      // 1
      await Amplify.Auth.signOut();
      final state = AuthState(authFlowStatus: AuthFlowStatus.login);
      authStateController.add(state);
      // 2
      showLogin();
    } on AmplifyException catch (authError) {
      print('Failed to log out - ${authError.message}');
    }
  }

  void checkAuthStatus() async {
    final result = await Amplify.Auth.fetchAuthSession();
    if (result.isSignedIn) {
      final state = AuthState(authFlowStatus: AuthFlowStatus.session);
      authStateController.add(state);
      // return result.isSignedIn;
    } else {
      final state = AuthState(authFlowStatus: AuthFlowStatus.login);
      authStateController.add(state);
      // return false;
    }
  }

  void showforgetPassword() {
    final state = AuthState(authFlowStatus: AuthFlowStatus.forgetpass);
    authStateController.add(state);
    // print('im working');
  }

  void resetPassword(RecoverEmailCredentials credentials) async {
    bool isPasswordReset;
    try {
      final result = await Amplify.Auth.resetPassword(
        username: credentials.email,
      );
      showforgetPassword();

      isPasswordReset = result.isPasswordReset;
      if (isPasswordReset) {
        // showforgetPassword();
      }
    } on AmplifyException catch (e) {
      safePrint(e);
    }
  }

  Future<void> confirmResetPassword(ForgetPassCredentials credentials) async {
    try {
      await Amplify.Auth.confirmResetPassword(
          username: credentials.email,
          newPassword: credentials.password,
          confirmationCode: credentials.code);
      showLogin();
    } on AmplifyException catch (e) {
      print(e);
    }
  }
}
