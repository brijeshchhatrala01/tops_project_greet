import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:tops_project_greet/pages/user/constant.dart';

import '../onboarding/onboarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  //check connectivity when device open an app
  @override
  void initState() {
    super.initState();
    _checkConnection();
  }

  //go to next screen after 4 seconds of timer
  _goToOnBoarding() {
    Timer(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const OnBoarding(),
        ),
      );
    });
  }

  //show this dialog if network error encountered
  _showConnectionDialog() async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: kGrey,
          title: const Row(
            children: [
              Icon(Icons.error),
              Text('\tNetwork Error'),
            ],
          ),
          content: const Text(
            'Please Check Your Internet Connection',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
          actions: [
            ElevatedButton(
              onPressed: () => exit(0),
              child: const Text(
                'Exit',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ],
        );
      },
    );
  }

  //check network connectivity with connectivity package and navigate
  _checkConnection() async {
    var connection = await Connectivity().checkConnectivity();

    if (connection == ConnectivityResult.mobile) {
      _goToOnBoarding();
    } else if (connection == ConnectivityResult.wifi) {
      _goToOnBoarding();
    } else {
      _showConnectionDialog();
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kLightGold,
      body: Center(
        child: Transform.rotate(
          angle: -pi / 5,
          child: Image(
            image: const AssetImage('images/logo.jpg'),
            height: height - 360,
            width: width - 330,
          ),
        ),
      ),
    );
  }
}
