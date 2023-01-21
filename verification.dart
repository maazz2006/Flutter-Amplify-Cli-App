import 'package:flutter/material.dart';

// ignore: camel_case_types
class verificationPageWidget extends StatefulWidget {
  final ValueChanged<String>? didProvideVerificationCode;
  final VoidCallback? shouldShowLogin;

  const verificationPageWidget(
      {super.key, this.didProvideVerificationCode, this.shouldShowLogin});

  @override
  State<StatefulWidget> createState() => _verificationPageWidgetState();
}

// ignore: camel_case_types
class _verificationPageWidgetState extends State<verificationPageWidget> {
  bool isloading = false;
  final _verificationCodeController = TextEditingController();

  void _verify() {
    final verificationCode = _verificationCodeController.text.trim();

    widget.didProvideVerificationCode!(verificationCode);
    widget.shouldShowLogin;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
          child: Container(
              width: 400,
              height: 830,
              decoration: const BoxDecoration(color: Colors.white
                  // color: Color.fromRGBO(248, 229, 245, 1),
                  ),
              child: Stack(children: <Widget>[
                Positioned(
                  top: 604,
                  left: 35,
                  child: SizedBox(
                      width: 325,
                      height: 55,
                      child: ElevatedButton(
                        onPressed: () async {
                          setState(() {
                            isloading = true;
                          });
                          _verify();

                          await Future.delayed(const Duration(seconds: 8));
                          setState(() {
                            isloading = false;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 156, 29, 72),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100)),
                        ),
                        child: (isloading)
                            ? const SizedBox(
                                width: 16,
                                height: 16,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 1.5,
                                ))
                            : const Text("Verify"),
                      )),
                ),
                const Positioned(
                    top: 431,
                    left: 118,
                    child: Text(
                      'Enter Code To Verify',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontFamily: 'Outfit',
                          fontSize: 16,
                          letterSpacing:
                              0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.w500,
                          height: 1),
                    )),
                Positioned(
                    top: 456,
                    left: 113,
                    child: Container(
                      width: 150,
                      height: 55,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(100),
                            topRight: Radius.circular(100),
                            bottomLeft: Radius.circular(100),
                            bottomRight: Radius.circular(100),
                          ),
                          color: Color.fromRGBO(249, 229, 245, 1)),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextFormField(
                          style: const TextStyle(fontSize: 20),
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          controller: _verificationCodeController,
                          decoration:
                              const InputDecoration.collapsed(hintText: ""),
                        ),
                      ),
                    )),
                const Positioned(
                    top: 117,
                    left: 113,
                    child: Text(
                      'Verification',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1),
                          fontFamily: 'Outfit',
                          fontSize: 32,
                          letterSpacing:
                              0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.w500,
                          height: 1),
                    )),
                const Positioned(
                    top: 580,
                    left: 110,
                    child: Text(
                      'Have’nt receive ? send again',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromRGBO(126, 124, 124, 1),
                          fontFamily: 'Outfit',
                          fontSize: 14,
                          letterSpacing:
                              0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.normal,
                          height: 1),
                    )),
                Positioned(
                    top: 166,
                    left: 113,
                    child: Container(
                        width: 150,
                        height: 150,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/fingerprintverification.png'),
                              fit: BoxFit.fitWidth),
                        ))),
              ]))),
    );
  }
}
      // Figma Flutter Generator VerificationWidget - FRAME
      