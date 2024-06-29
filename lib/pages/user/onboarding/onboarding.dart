// ignore_for_file: non_constant_identifier_names, unnecessary_new, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tops_project_greet/pages/user/constant.dart';
import 'package:tops_project_greet/pages/user/front/front.dart';
import 'package:tops_project_greet/pages/user/login/login.dart';
import 'package:tops_project_greet/pages/user/onboarding/widgets/header.dart';
import 'package:tops_project_greet/pages/user/onboarding/widgets/next_page_btn.dart';
import 'package:tops_project_greet/pages/user/onboarding/widgets/onboarding_page.dart';
import 'package:tops_project_greet/pages/user/onboarding/widgets/onboarding_page_indicator.dart';
import 'package:tops_project_greet/pages/user/onboarding/widgets/pages/community/community_dark_card.dart';
import 'package:tops_project_greet/pages/user/onboarding/widgets/pages/community/community_light_card.dart';
import 'package:tops_project_greet/pages/user/onboarding/widgets/pages/community/community_text.dart';
import 'package:tops_project_greet/pages/user/onboarding/widgets/pages/relationship/relationship_dark_card.dart';
import 'package:tops_project_greet/pages/user/onboarding/widgets/pages/relationship/relationship_light_card.dart';
import 'package:tops_project_greet/pages/user/onboarding/widgets/pages/relationship/relationship_text.dart';
import 'package:tops_project_greet/pages/user/onboarding/widgets/pages/work/work_dark_card.dart';
import 'package:tops_project_greet/pages/user/onboarding/widgets/pages/work/work_light_card.dart';
import 'package:tops_project_greet/pages/user/onboarding/widgets/pages/work/work_text.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int _currentPage = 1;
  bool get isFirstPage => _currentPage == 1;


  late bool newuser;
  late SharedPreferences sharedPreferences;
  void check_if_already_login() async {
    sharedPreferences =
        await SharedPreferences.getInstance(); //initialize sharedprefrence
    newuser = sharedPreferences.getBool('ewishes') ?? true;

    if (newuser == false) {
      Navigator.pushReplacement(
          context, new MaterialPageRoute(builder: (context) => const Front()));
    }
  }

  @override
  void initState() {
    check_if_already_login();
    super.initState();
  }

  Widget _getPage() {
    switch (_currentPage) {
      case 1:
        return const OnBoardingPage(
            number: 1,
            lightCardChild: CommunityLightCard(),
            darkCardChild: CommunityDarkCard(),
            textColumn: CommunityTextColumn());
      case 2:
        return const OnBoardingPage(
            number: 2,
            lightCardChild: RelationshipLightCard(),
            darkCardChild: RelationShipDark(),
            textColumn: RelationshipText());
      case 3:
        return const OnBoardingPage(
            number: 3,
            lightCardChild: WorkLightCard(),
            darkCardChild: WorkDarkCard(),
            textColumn: WorkText());
      default:
        throw Exception('page with $_currentPage not found!');
    }
  }

  void setNextPage(int nextPageNumber) {
    setState(() {
      _currentPage = nextPageNumber;
    });
  }

  void _nextPage() {
    switch (_currentPage) {
      case 1:
        setNextPage(2);
        break;
      case 2:
        setNextPage(3);
        break;
      case 3:
        _goToLogin();
        break;
    }
  }

  void _goToLogin() {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const Login(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBrown,
      body: SafeArea(
          child: Column(
        children: [
          Header(onTap: _goToLogin),
          Expanded(child: _getPage()),
          OnBoardingPageIndicator(
            currentPage: _currentPage,
            child: NextPageButton(
              onPressed: _nextPage,
            ),
          ),
        ],
      )),
    );
  }
}
