import 'package:flutter/material.dart';
import 'package:tops_project_greet/pages/user/ragister/authcheck/authcheck.dart';
import '../constant.dart';
import '../login/login.dart';
import '../login/widgets/customclipper/brown_top_clipper.dart';
import '../login/widgets/customclipper/gold_top_clipper.dart';
import '../login/widgets/customclipper/lightgold_top_clipper.dart';
import 'widgets/header.dart';

// ignore: use_key_in_widget_constructors
class Register extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RegisterPage();
  }
}

class RegisterPage extends State<Register> {
  RegisterPage();

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  bool _isObscurePassword = true;
  bool _isObscureConfirmPassword = true;
  var identifier = "User";
  var username = TextEditingController();
  var password = TextEditingController();
  var confirmpassword = TextEditingController();
  var mobilenumber = TextEditingController();

  void insertData() async {
    //Fluttertoast.showToast(msg: "Registration Successfully Completed",toastLength: Toast.LENGTH_LONG,timeInSecForIosWeb: 1);

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => OTPAuthCheck(
                  username: username.text.toString(),
                  mobile: mobilenumber.text.toString(),
                  password: password.text.toString(),
                  identifier: identifier,
                )));
  }

  @override
  Widget build(BuildContext context) {
    final height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    final space = height > 650 ? kSpaceM : kSpaceS;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        key: scaffoldKey,
        resizeToAvoidBottomInset: false,
        backgroundColor: kLightGold,
        body: Stack(
          children: [
            ClipPath(
              clipper: const GoldTopClipper(),
              child: Container(color: kGold),
            ),
            ClipPath(
              clipper: const BrownTopClipper(),
              child: Container(color: kBrown),
            ),
            ClipPath(
              clipper: const LightGoldTopClipper(),
              child: Container(color: kLightGold),
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: kPaddingL),
                child: Column(
                  children: [
                    const Header(),
                    //Spacer(),

                    Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: kPaddingL),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: space * 7),
                          Text(
                            'Register here if you do not have account in E-wishes',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(color: kDarkBrown.withOpacity(0.7)),
                          ),
                          SizedBox(height: space - 5),
                          TextField(
                            controller: username,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(kPaddingS),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black.withOpacity(0.12)),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black.withOpacity(0.12)),
                              ),
                              hintText: 'Username',
                              hintStyle: TextStyle(
                                color: kBlack.withOpacity(0.5),
                                fontWeight: FontWeight.w500,
                              ),
                              prefixIcon: Icon(
                                Icons.person,
                                color: kBlack.withOpacity(0.5),
                              ),
                            ),
                          ),
                          SizedBox(height: space - 6),
                          TextField(
                            controller: password,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(kPaddingS),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black.withOpacity(0.12)),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black.withOpacity(0.12)),
                              ),
                              hintText: 'Password',
                              hintStyle: TextStyle(
                                color: kBlack.withOpacity(0.5),
                                fontWeight: FontWeight.w500,
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(_isObscurePassword
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                                onPressed: () {
                                  setState(() {
                                    _isObscurePassword = !_isObscurePassword;
                                  });
                                },
                              ),
                              prefixIcon: Icon(
                                Icons.lock,
                                color: kBlack.withOpacity(0.5),
                              ),
                            ),
                            obscureText: _isObscurePassword,
                          ),
                          SizedBox(height: space - 6),
                          TextField(
                            controller: confirmpassword,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(kPaddingS),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black.withOpacity(0.12)),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black.withOpacity(0.12)),
                              ),
                              hintText: 'Confirm Password',
                              hintStyle: TextStyle(
                                color: kBlack.withOpacity(0.5),
                                fontWeight: FontWeight.w500,
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(_isObscureConfirmPassword
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                                onPressed: () {
                                  setState(() {
                                    _isObscureConfirmPassword =
                                        !_isObscureConfirmPassword;
                                  });
                                },
                              ),
                              prefixIcon: Icon(
                                Icons.lock,
                                color: kBlack.withOpacity(0.5),
                              ),
                            ),
                            obscureText: _isObscureConfirmPassword,
                          ),
                          SizedBox(height: space - 6),
                          TextField(
                            controller: mobilenumber,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(kPaddingS),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black.withOpacity(0.12)),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black.withOpacity(0.12)),
                              ),
                              hintText: 'Mobile Number',
                              hintStyle: TextStyle(
                                color: kBlack.withOpacity(0.5),
                                fontWeight: FontWeight.w500,
                              ),
                              prefixIcon: Icon(
                                Icons.phone,
                                color: kBlack.withOpacity(0.5),
                              ),
                            ),
                          ),
                          SizedBox(height: space - 8),
                          ConstrainedBox(
                            constraints: const BoxConstraints(
                              minWidth: double.infinity,
                            ),
                            child: TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: kDarkBrown,
                                padding: const EdgeInsets.all(kPaddingS + 5),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                              ),
                              onPressed: () {
                                insertData();
                              },
                              //},
                              child: Text(
                                "Register an E-wishes Account",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                        color: kGold,
                                        fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          SizedBox(height: space - 8),
                          ConstrainedBox(
                            constraints: const BoxConstraints(
                              minWidth: double.infinity,
                            ),
                            child: TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: kGold,
                                padding: const EdgeInsets.all(kPaddingS + 5),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                              ),
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Login()));
                              },
                              child: Text(
                                "Already Have an Account? Login",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                      color: kDarkBrown,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                          ),
                          SizedBox(height: space - 8),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
