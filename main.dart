import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:flutter/material.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:foodie_final_year_project/forgetpass.dart';
import 'package:foodie_final_year_project/intro.dart';
import 'package:foodie_final_year_project/recoverEmail.dart';
import 'package:foodie_final_year_project/signupPage.dart';
import 'package:foodie_final_year_project/verification.dart';

import 'amplifyconfiguration.dart';
import 'authenticationService/auth_service.dart';

import 'homeScreen.dart';
import 'loginpage.dart';
import 'models/ModelProvider.dart';

void main() {
  runApp(const FOODIEAPP());
}

class FOODIEAPP extends StatefulWidget {
  const FOODIEAPP({super.key});
  @override
  State<StatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<FOODIEAPP> {
  final _authService = AuthService();
  // var _sugg = <Suggester>[];
  @override
  void initState() {
    super.initState();

    _configureAmplify().then((value) => {_authService.checkAuthStatus()});
    // readFromDatabase();

    //super.initState();
    // _authService.showLogin();

    // _authService.showSignUp();
  }

  Future<void> _configureAmplify() async {
    final dsplugin = AmplifyDataStore(modelProvider: ModelProvider.instance);
    final authplugin = AmplifyAuthCognito();

    final api = AmplifyAPI(modelProvider: ModelProvider.instance);
    // await Amplify.addPlugin(api);
    await Amplify.addPlugins([authplugin, dsplugin, api]);
    try {
      await Amplify.configure(amplifyconfig);
    } on AmplifyAlreadyConfiguredException {
      safePrint("already configured");
    }
  }

  // Future<void> readFromDatabase() async {
  //   try {
  //     // List<Suggestion> posts =
  //     _sugg = await Amplify.DataStore.query(Suggester.classType);
  //     debugPrint(_sugg.toString());
  //     // return posts;
  //   } on DataStoreException catch (e) {
  //     print('Query failed: $e');
  //     rethrow;
  //   }
  // }
  // Future<void> insertTodo() async {
  //   final item = Todo(desc: "Lorem ipsum dolor sit amet");
  //   await Amplify.DataStore.save(item);
  // }

  // void retriveTodo() async {
  //   try {
  //     List<Todo> Todos = await Amplify.DataStore.query(Todo.classType);
  //     debugPrint(Todos.toString());
  //   } catch (e) {
  //     safePrint("Could not query DataStore: ");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Foodie',
      theme: ThemeData(
          primaryColor: Colors.redAccent[100], primarySwatch: Colors.pink),
      home: StreamBuilder<AuthState>(
          stream: _authService.authStateController.stream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Navigator(
                pages: [
                  // Show Login Page
                  if (snapshot.data!.authFlowStatus ==
                      AuthFlowStatus.recoveremail)
                    MaterialPage(
                        child: RecoverEmailScreen(
                      didProvideCredentials: _authService.resetPassword,
                      shouldShowLogin: _authService.showLogin,
                    )),
                  if (snapshot.data!.authFlowStatus == AuthFlowStatus.session)
                    MaterialPage(
                        child: HomeScreen(
                      shouldLogOut: _authService.logOut,
                    )),
                  if (snapshot.data!.authFlowStatus ==
                      AuthFlowStatus.forgetpass)
                    MaterialPage(
                        child: ForgetPasswordScreen(
                      // shouldShowLogin: _authService.showLogin,
                      didProvideCredentials: _authService.confirmResetPassword,
                      // showMap: _authService.showMap,
                    )),
                  if (snapshot.data!.authFlowStatus == AuthFlowStatus.login)
                    MaterialPage(
                        child: LoginpageWidget(
                      didProvideCredentials: _authService.loginWithCredentials,
                      shouldShowSignUp: _authService.showSignUp,
                      did: _authService.resetPassword,
                      shouldshowRecoer: _authService.showRecoverEmail,
                    )),
                  if (snapshot.data!.authFlowStatus == AuthFlowStatus.signUp)
                    MaterialPage(
                        child: SignuppageWidget(
                      didProvideCredentials: _authService.signUpWithCredentials,
                      shouldShowVerification: _authService.showVerification,
                      shouldshowLogin: _authService.showLogin,
                    )),
                  if (snapshot.data!.authFlowStatus ==
                      AuthFlowStatus.verification)
                    MaterialPage(
                        child: verificationPageWidget(
                            didProvideVerificationCode:
                                _authService.verifyCode)),
                ],
                onPopPage: (route, result) => route.didPop(result),
              );
            } else {
              // 6
              // return Padding(
              //   padding: const EdgeInsets.only(top: 30),
              //   child: Container(
              //     alignment: Alignment.center,
              //     child: const CircularProgressIndicator(),
              //   ),
              // );
              return const Navigator(
                pages: [MaterialPage(child: IntroPageWidget())],
              );
            }
          }),
    );
  }
}
