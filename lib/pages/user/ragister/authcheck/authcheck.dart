// ignore_for_file: unused_field, avoid_print

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tops_project_greet/pages/user/constant.dart';
import 'package:http/http.dart' as http;
import 'package:tops_project_greet/pages/user/login/login.dart';

class OTPAuthCheck extends StatefulWidget {
  final String username;
  final String password;
  final String mobile;
  final String identifier;
  const OTPAuthCheck(
      {super.key,
      required this.username,
      required this.password,
      required this.mobile,
      required this.identifier});

  @override
  State<OTPAuthCheck> createState() => _OTPAuthCheckState();
}

class _OTPAuthCheckState extends State<OTPAuthCheck> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String _verificationId = '';

  //var otp = TextEditingController();

  Future<void> verifyPhone(String phoneNumber) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      timeout: const Duration(seconds: 120),
      verificationCompleted: (AuthCredential credential) async {
        await _auth.signInWithCredential(credential);
        
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          print('The provided phone number is not valid.');
        }
      },
      codeSent: (String verificationId, int? resendToken) {
        setState(() {
          _verificationId = verificationId;
        });
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        setState(() {
          _verificationId = verificationId;
        });
      },
    );
  }

  String time = '';
  int counterTime = 1;
  @override
  void initState() {
    verifyPhone("+91${widget.mobile.toString()}");
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        counterTime = timer.tick;
        print(counterTime);
      });
      counterTime++;
      if (timer.tick == 120) {
        timer.cancel();
      }
    });
    super.initState();
  }

  bool isOTPCorrect = false;

  final _otpController = TextEditingController();

  Future<void> signInWithPhoneNumber(String smsCode) async {
    try {
      final AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: '',
        smsCode: smsCode,
      );

      await _auth
          .signInWithCredential(credential)
          .then((value) => isOTPCorrect = true);
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: kLightGold,
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _otpController,
              decoration: const InputDecoration(
                hintText: 'Enter OTP',
              ),
              validator: (value) {
                return value!.isEmpty ? 'please enter an OTP' : null;
              },
            ),
            const SizedBox(
              height: 18,
            ),
            Text("120 : ${counterTime.toString()}"),
            const SizedBox(
              height: 18,
            ),
            ElevatedButton(
                onPressed: () async {
                  await signInWithPhoneNumber(_otpController.text.toString())
                      .then((value) {
                    if (isOTPCorrect) {
                      var signupurl =
                          "https://zoological-wafer.000webhostapp.com/EWishes/register_insert.php";
                      http.post(Uri.parse(signupurl), body: {
                        "username": widget.username,
                        "password": widget.password,
                        "mobile_no": widget.mobile,
                        "identifier": widget.identifier,
                      }).then((value) => goToLogin());
                    } else {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(const SnackBar(content: Text('False OTP')));
                    }
                  });
                },
                child: const Text('C O N F I R M  O T P'))
          ],
        ),
      ),
    );
  }

  goToLogin() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Login(),
      ),
    );
  }
}
