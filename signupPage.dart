import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'authenticationService/auth_credentials.dart';

class SignuppageWidget extends StatefulWidget {
  final VoidCallback? shouldShowVerification;
  final ValueChanged<SignUpCredentials>? didProvideCredentials;

  final VoidCallback shouldshowLogin;

  const SignuppageWidget(
      {Key? key,
      this.didProvideCredentials,
      this.shouldShowVerification,
      required this.shouldshowLogin})
      : super(key: key);

  @override
  _SignuppageWidgetState createState() => _SignuppageWidgetState();
}

class _SignuppageWidgetState extends State<SignuppageWidget> {
  final _emailController = TextEditingController();
  final _phonenumberController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  bool isobscure = true;
  bool isobscure2 = true;

  bool isloading = false;
  void _signUp() {
    final email = _emailController.text.trim();
    final phonenumber = _phonenumberController.text.trim();
    final password = _passwordController.text.trim();
    final confirmPassWord = _confirmPasswordController.text.trim();

    // print('email: $email');
    // print('phonenumber: $phonenumber');
    // print('password: $password');
    // print('confirmPassWrd: $confirmPassWord');

    final credentials = SignUpCredentials(
        phonenumber: phonenumber,
        email: email,
        password: password,
        confirmPassword: confirmPassWord);
    widget.didProvideCredentials!(credentials);
    widget.shouldShowVerification;
  }

  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator SignuppageWidget - FRAME

    return Scaffold(
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
                                            color: Colors.white,
                                          ))),

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
                                    top: 220,
                                    left: 30,
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
                                      child: Text('Mobile No:'),
                                    ),
                                  ),

//mobileNO-textbox
                                  Stack(
                                    children: [
                                      Container(
                                          padding: const EdgeInsets.only(
                                              top: 243, left: 24),
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
                                            top: 238, left: 30, right: 20),
                                        child: TextFormField(
                                          controller: _phonenumberController,
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
                                                icon: const Icon(Icons.phone)),
                                            hintText: "",

                                            // contentPadding:
                                            //     const EdgeInsets.only(top: 60)
                                          ),
                                          validator: (value) {
                                            bool passvalid =
                                                RegExp(r"([+92])\w+")
                                                    .hasMatch(value!);
                                            if (value.isEmpty) {
                                              return '* Enter Phone Number';
                                            } else if (!passvalid) {
                                              return '* Enter Phone Number With Country Code';
                                            } else if (value.length != 13) {
                                              return '* Enter Valid Phone Number';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                    ],
                                  ),

                                  const Positioned(
                                      top: 308,
                                      left: 30,
                                      child: Text(
                                        'Password: ',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'Inter',
                                            fontSize: 12,
                                            letterSpacing:
                                                0 /*percentages not used in flutter. defaulting to zero*/,
                                            fontWeight: FontWeight.w500,
                                            height: 1),
                                      )),
//password textbox
                                  Stack(
                                    children: [
                                      Container(
                                          padding: const EdgeInsets.only(
                                              top: 331, left: 24),
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
                                            top: 326, left: 30, right: 20),
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
                                            bool isCap =
                                                RegExp(r'^(?=.*?[A-Z])')
                                                    .hasMatch(value!);
                                            bool isNum =
                                                RegExp(r'^(?=.*?[0-9])')
                                                    .hasMatch(value);
                                            if (value == null ||
                                                value.isEmpty) {
                                              return '* Enter Password';
                                            } else if (!isCap) {
                                              return "* At Least One UpperCase Letter";
                                            } else if (!isNum) {
                                              return "* Weak Passowrd, Use Numbers ";
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Positioned(
                                      top: 396,
                                      left: 26,
                                      child: Text(
                                        'Confirm Password:',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'Inter',
                                            fontSize: 12,
                                            letterSpacing:
                                                0 /*percentages not used in flutter. defaulting to zero*/,
                                            fontWeight: FontWeight.w500,
                                            height: 1),
                                      )),
//confirm password textbox
                                  Stack(
                                    children: [
                                      Container(
                                          padding: const EdgeInsets.only(
                                              top: 419, left: 24),
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
                                            top: 414, left: 30, right: 20),
                                        child: TextFormField(
                                          controller:
                                              _confirmPasswordController,
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
                                                  isobscure2 = !isobscure2;
                                                });
                                              },
                                              icon: (isobscure2)
                                                  ? const Icon(Icons.visibility)
                                                  : const Icon(
                                                      Icons.visibility_off),
                                            ),
                                          ),
                                          obscureText: isobscure2,
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return '* Enter Confirm Password';
                                            }
                                            if (value !=
                                                _passwordController.text) {
                                              return "* Password Doesn't Match ";
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Positioned(
                                      top: 132,
                                      left: 36,
                                      child: Text(
                                        'Email:',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'Inter',
                                            fontSize: 12,
                                            letterSpacing:
                                                0 /*percentages not used in flutter. defaulting to zero*/,
                                            fontWeight: FontWeight.w500,
                                            height: 1),
                                      )),

//email text box
                                  Stack(
                                    children: [
                                      Container(
                                          padding: const EdgeInsets.only(
                                              top: 155, left: 24),
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
                                            top: 150, left: 30, right: 20),
                                        child: TextFormField(
                                          controller: _emailController,
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

//already a user
                                  Positioned(
                                    top: 550,
                                    left: 70,
                                    child: SizedBox(
                                      child: RichText(
                                        text: TextSpan(
                                          children: <TextSpan>[
                                            const TextSpan(
                                                text:
                                                    "Already have an account? ",
                                                style: TextStyle(
                                                    color: Colors.black)),
                                            TextSpan(
                                                text: "Login",
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 15,
                                                    color: Colors.deepPurple,
                                                    decoration: TextDecoration
                                                        .underline),
                                                recognizer:
                                                    TapGestureRecognizer()
                                                      ..onTap = widget
                                                          .shouldshowLogin),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),

                                  Positioned(
                                    top: 480,
                                    left: 24,
                                    child: SizedBox(
                                        width: 290,
                                        height: 50,
                                        child: ElevatedButton(
                                          // width: 175,
                                          // height: 32,
                                          onPressed: () async {
                                            if (formkey.currentState!
                                                .validate()) {
                                              setState(() {
                                                isloading = true;
                                                _signUp();
                                              });
                                            }
                                            await Future.delayed(
                                                const Duration(seconds: 16));
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
                                              : const Text("SIGN UP"),
                                        )),
                                  )
                                ]))),
                      ]))),
              Positioned(
                  top: 700,
                  left: 55,
                  child: Transform.rotate(
                    angle: -1.987846675914698e-16 * (math.pi / 180),
                    child: const Text(
                      'WELCOME               FOODIES COMMUNITY',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1),
                          fontFamily: 'Rum Raisin',
                          fontSize: 15,
                          letterSpacing:
                              0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.w600,
                          height: 1),
                    ),
                  )),
              Positioned(
                  top: 630,
                  left: 132,
                  child: Container(
                      width: 157,
                      height: 190,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image:
                                AssetImage('assets/images/Forkwithnoodles.png'),
                            fit: BoxFit.fitWidth),
                      ))),
            ])),
      ),
    );
  }
}
