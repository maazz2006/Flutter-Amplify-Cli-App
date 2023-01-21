import 'package:flutter/material.dart';
// import 'dart:math' as math;

import 'authenticationService/auth_credentials.dart';

class ForgetPasswordScreen extends StatefulWidget {
  // final VoidCallback? shouldShowLogin;
  final ValueChanged<ForgetPassCredentials>? didProvideCredentials;

  const ForgetPasswordScreen({super.key, this.didProvideCredentials});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPasswordScreen> {
  final formkey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _verificationCodeController = TextEditingController();
  bool isobscure = true;
  bool isloading = false;
  void _forgetPass() {
    final email = _emailController.text.trim();
    final newpass = _newPasswordController.text.trim();
    final verify = _verificationCodeController.text.trim();
    final credentials =
        ForgetPassCredentials(email: email, code: verify, newPassword: newpass);
    widget.didProvideCredentials!(credentials);
    // widget.shouldShowLogin;
  }

  @override
  Widget build(BuildContext context) {
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
                                            color: Color.fromRGBO(
                                                249, 229, 245, 1),
                                          ))),

                                  const Positioned(
                                      top: 127,
                                      left: 30,
                                      child: Text(
                                        'Account recovery ',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'Outfit',
                                            fontSize: 29,
                                            letterSpacing:
                                                0 /*percentages not used in flutter. defaulting to zero*/,
                                            fontWeight: FontWeight.w200,
                                            height: 1),
                                      )),
                                  const Positioned(
                                      top: 308,
                                      left: 30,
                                      child: Text(
                                        'New Password: ',
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
                                              color: Colors.white,
                                            ),
                                          )),
                                      Container(
                                        padding: const EdgeInsets.only(
                                            top: 326, left: 30, right: 20),
                                        child: TextFormField(
                                          controller: _newPasswordController,
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
                                        'Verification Code',
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
                                              color: Colors.white,
                                            ),
                                          )),
                                      Container(
                                        padding: const EdgeInsets.only(
                                            top: 414, left: 30, right: 20),
                                        child: TextFormField(
                                          controller:
                                              _verificationCodeController,
                                          decoration: const InputDecoration(
                                            contentPadding: EdgeInsets.only(
                                                left: 6,
                                                right: 3,
                                                top: 14,
                                                bottom: 14),
                                            errorStyle: TextStyle(
                                                fontSize: 9, height: 0.3),
                                            border: InputBorder.none,
                                          ),
                                          keyboardType: TextInputType.number,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Positioned(
                                      top: 220,
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
                                              color: Colors.white,
                                            ),
                                          )),
                                      Container(
                                        padding: const EdgeInsets.only(
                                            top: 238, left: 30, right: 20),
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
//button
                                  Positioned(
                                    top: 490,
                                    left: 16,
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
                                                _forgetPass();
                                              });
                                            }
                                            await Future.delayed(
                                                const Duration(seconds: 8));
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
                                              : const Text("RESET PASSWORD"),
                                        )),
                                  )
                                ]))),
                      ]))),
              Positioned(
                  top: 590,
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
