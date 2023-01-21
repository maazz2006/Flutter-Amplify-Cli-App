import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'dart:math' as math;

import 'authenticationService/auth_credentials.dart';
// import 'authenticationService/auth_service.dart';

class LoginpageWidget extends StatefulWidget {
  final VoidCallback? shouldShowSignUp;
  final ValueChanged<LoginCredentials>? didProvideCredentials;
  final VoidCallback? showAuthstatus;

  final ValueChanged<RecoverEmailCredentials> did;
  final VoidCallback? shouldshowRecoer;

  const LoginpageWidget({
    Key? key,
    this.didProvideCredentials,
    this.shouldShowSignUp,
    this.showAuthstatus,
    required this.did,
    this.shouldshowRecoer,
    // this.shouldplz,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginpageWidgetState();
}

class _LoginpageWidgetState extends State<LoginpageWidget> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool isloading = false;
  bool isobscure = true;

  final formkey = GlobalKey<FormState>();

  void _login() {
    final username = _usernameController.text.trim();
    final password = _passwordController.text.trim();

    // print('username: $username');
    // print('password: $password');
    final credentials = LoginCredentials(email: username, password: password);
    widget.didProvideCredentials!(credentials);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: _scaffoldkey,
      body: Form(
        key: formkey,
        child: Container(
            width: 400,
            height: 830,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(248, 229, 245, 1),
            ),
            child: Stack(children: <Widget>[
              Positioned(
                  top: 70,
                  left: 25,
                  child: Container(
                      width: 334,
                      height: 655,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50),
                          bottomLeft: Radius.circular(50),
                          bottomRight: Radius.circular(50),
                        ),
                      ),
                      child: Stack(children: <Widget>[
                        //mainframe
                        Positioned(
                            top: 0,
                            left: 1,
                            child: Container(
                                width: 334,
                                height: 655,
                                decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(35),
                                      topRight: Radius.circular(35),
                                      bottomLeft: Radius.circular(35),
                                      bottomRight: Radius.circular(35),
                                    ),
                                    // color: Color.fromRGBO(255, 31, 72, 1),
                                    color: Colors.white))),
                        Positioned(
                            top: 0,
                            left: 0,
                            child: Container(
                                width: 334,
                                height: 655,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(70),
                                    topRight: Radius.circular(70),
                                    bottomLeft: Radius.circular(70),
                                    bottomRight: Radius.circular(70),
                                  ),
                                ),
                                child: Stack(children: <Widget>[
                                  Positioned(
                                      top: -9,
                                      left: 91,
                                      child: Container(
                                          width: 140.60606384277344,
                                          height: 100,
                                          decoration: const BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/images/Foodielogo.png'),
                                                fit: BoxFit.fitWidth),
                                          ))),

                                  const Positioned(
                                    top: 161,
                                    left: 37,
                                    child: DefaultTextStyle(
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Inter',
                                          fontSize: 12,
                                          letterSpacing:
                                              0 /*percentages not used in flutter. defaulting to zero*/,
                                          fontWeight: FontWeight.w500,
                                          height: 1),
                                      child: Text('Email: '),
                                    ),
                                  ),
                                  //stack for username
                                  Stack(
                                    children: [
                                      Container(
                                          padding: const EdgeInsets.only(
                                              top: 190, left: 20),
                                          child: Container(
                                            width: 290,
                                            height: 35,
                                            decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(100),
                                                topRight: Radius.circular(100),
                                                bottomLeft:
                                                    Radius.circular(100),
                                                bottomRight:
                                                    Radius.circular(100),
                                              ),
                                              color: Color.fromRGBO(
                                                  249, 229, 245, 1),
                                            ),
                                          )),
                                      Container(
                                        padding: const EdgeInsets.only(
                                            top: 185, left: 30, right: 20),
                                        child: TextFormField(
                                          controller: _usernameController,
                                          decoration: InputDecoration(
                                            contentPadding:
                                                const EdgeInsets.only(
                                                    left: 6,
                                                    right: 3,
                                                    top: 14,
                                                    bottom: 14),
                                            errorStyle: const TextStyle(
                                                fontSize: 9, height: 0.3),

                                            border: InputBorder.none,
                                            suffixIcon: IconButton(
                                                padding: const EdgeInsets.only(
                                                    bottom: 2, right: 2),
                                                onPressed: () {},
                                                icon: const Icon(Icons.email)),
                                            hintText: "",

                                            // contentPadding:
                                            //     const EdgeInsets.only(top: 60)
                                          ),
                                          validator: (value) {
                                            bool emailvalid = RegExp(
                                                    r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$")
                                                .hasMatch(value!);
                                            if (value.isEmpty) {
                                              return '* Enter Email';
                                            } else if (!emailvalid) {
                                              return '* Enter Valid Email';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
//password stack
                                  Stack(
                                    children: [
                                      Container(
                                          padding: const EdgeInsets.only(
                                              top: 280, left: 20),
                                          child: Container(
                                            width: 290,
                                            height: 35,
                                            decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(100),
                                                topRight: Radius.circular(100),
                                                bottomLeft:
                                                    Radius.circular(100),
                                                bottomRight:
                                                    Radius.circular(100),
                                              ),
                                              color: Color.fromRGBO(
                                                  249, 229, 245, 1),
                                            ),
                                          )),
                                      Container(
                                        padding: const EdgeInsets.only(
                                            top: 275, left: 30, right: 20),
                                        child: TextFormField(
                                          controller: _passwordController,
                                          decoration: InputDecoration(
                                            contentPadding:
                                                const EdgeInsets.only(
                                                    left: 6,
                                                    right: 3,
                                                    top: 14,
                                                    bottom: 14),
                                            errorStyle: const TextStyle(
                                                fontSize: 9, height: 0.3),
                                            border: InputBorder.none,
                                            suffixIcon: IconButton(
                                              padding: const EdgeInsets.only(
                                                  bottom: 2, right: 2),
                                              onPressed: () {
                                                setState(() {
                                                  isobscure = !isobscure;
                                                });
                                              },
                                              icon: (isobscure)
                                                  ? const Icon(Icons.visibility)
                                                  : const Icon(
                                                      Icons.visibility_off),
                                            ),
                                          ),
                                          obscureText: isobscure,
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return '* Enter Password';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Positioned(
                                    top: 250,
                                    left: 35,
                                    child: DefaultTextStyle(
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Inter',
                                          fontSize: 12,
                                          letterSpacing:
                                              0 /*percentages not used in flutter. defaulting to zero*/,
                                          fontWeight: FontWeight.w500,
                                          height: 1),
                                      //password
                                      child: Text('Password:'),
                                    ),
                                  ),
//forgetpassword

                                  Positioned(
                                    top: 328,
                                    left: 195,
                                    child: SizedBox(
                                        child: RichText(
                                      text: TextSpan(
                                          text: 'Forgot Password?',
                                          style: const TextStyle(
                                            color: Colors.deepPurple,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = widget.shouldshowRecoer),
                                    )),
                                  ),

                                  Positioned(
                                      top: 435,
                                      left: 75,

//singup button
                                      child: SizedBox(
                                        child: RichText(
                                            text: TextSpan(
                                          children: <TextSpan>[
                                            const TextSpan(
                                                text: "Don't have an account? ",
                                                style: TextStyle(
                                                    color: Colors.black)),
                                            TextSpan(
                                                text: "Sign Up",
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 15,
                                                    color: Colors.deepPurple,
                                                    decoration: TextDecoration
                                                        .underline),
                                                recognizer:
                                                    TapGestureRecognizer()
                                                      ..onTap = widget
                                                          .shouldShowSignUp),
                                          ],
                                        )),
                                      )),

//login button
                                  Positioned(
                                      top: 366,
                                      left: 22,
                                      child: SizedBox(
                                        width: 290,
                                        height: 50,
                                        child: ElevatedButton(
                                          onPressed: () async {
                                            if (formkey.currentState!
                                                .validate()) {
                                              setState(() {
                                                isloading = true;
                                                _login();
                                              });

                                              await Future.delayed(
                                                  const Duration(seconds: 10));
                                            }

                                            setState(() {
                                              isloading = false;
                                            });
                                          },
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  const Color.fromARGB(
                                                      255, 156, 29, 72),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                // border radius equal to or more than 50% of width
                                              )),
                                          child: (isloading)
                                              ? const SizedBox(
                                                  width: 16,
                                                  height: 16,
                                                  child:
                                                      CircularProgressIndicator(
                                                    color: Colors.white,
                                                    strokeWidth: 1.5,
                                                  ))
                                              : const Text("Login"),
                                        ),
                                      )),
                                ]))),
                      ]))),
              Positioned(
                  top: 575,
                  left: 125,
                  child: Container(
                      width: 157,
                      height: 120,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image:
                                AssetImage('assets/images/Forkwithnoodles.png'),
                            fit: BoxFit.fitWidth),
                      ))),
              Positioned(
                  top: 700,
                  left: 65,
                  child: Transform.rotate(
                    angle: -1.987846675914698e-16 * (math.pi / 180),
                    child: const DefaultTextStyle(
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1),
                          fontFamily: 'Rum Raisin',
                          fontSize: 15,
                          letterSpacing:
                              0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.w600,
                          height: 1),
                      child: Text('HELLO FOODIE , EXCITED TO BE HERE ?'),
                    ),
                  )),
            ])),
      ),
    );
  }
}
