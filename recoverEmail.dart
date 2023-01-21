import 'package:flutter/material.dart';
import 'package:foodie_final_year_project/authenticationService/auth_credentials.dart';
// import 'dart:math' as math;

class RecoverEmailScreen extends StatefulWidget {
  // final VoidCallback? shouldShowForgetPassword;
  final ValueChanged<RecoverEmailCredentials>? didProvideCredentials;
  final VoidCallback shouldShowLogin;
  const RecoverEmailScreen(
      {super.key, this.didProvideCredentials, required this.shouldShowLogin});

  @override
  State<RecoverEmailScreen> createState() => _RecoverEmailScreenState();
}

class _RecoverEmailScreenState extends State<RecoverEmailScreen> {
  final formkey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  void _recoveremail() {
    final username = _emailController.text.trim();

    // print('username: $username');
    // print('password: $password');
    final credentials = RecoverEmailCredentials(email: username);
    widget.didProvideCredentials!(credentials);
  }

  bool isobscure = true;
  bool isloading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        Padding(
          padding: const EdgeInsets.only(right: 325.0),
          child: IconButton(
              iconSize: 40,
              onPressed: widget.shouldShowLogin,
              icon: const Icon(Icons.arrow_back)),
        )
      ]),
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

//confirm password textbox

                                  const Positioned(
                                      top: 397,
                                      left: 36,
                                      child: Text(
                                        'Email: ',
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
                                              top: 420, left: 24),
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
                                            top: 415, left: 30, right: 20),
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
//nextbutton
                                  Positioned(
                                    top: 490,
                                    left: 196,
                                    child: SizedBox(
                                        width: 120,
                                        height: 50,
                                        child: ElevatedButton(
                                          // width: 175,
                                          // height: 32,
                                          onPressed: () async {
                                            if (formkey.currentState!
                                                .validate()) {
                                              setState(() {
                                                isloading = true;
                                                // _forgetPass();
                                                _recoveremail();
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
                                              : const Text("NEXT"),
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
