import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../bottom_navigation/download/download.dart';
import '../bottom_navigation/home/home.dart';
import '../constant.dart';
import '../login/login.dart';

class Front extends StatefulWidget{
  const Front({super.key});

  @override
  FrontPage createState() => FrontPage();
}

class FrontPage extends State<Front> {

  late SharedPreferences sharedPreferences;
  String myusername="";

  @override
  void initState() {
    super.initState();
    initial();
  }

  initial() async
  {
    sharedPreferences = await SharedPreferences.getInstance();

    setState(()
    {
      myusername = sharedPreferences.getString('username')!;
    });
  }

  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>
  [
     const Home(),
     const Download(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to E wishes $myusername', style: const TextStyle(color: kGold),),
        automaticallyImplyLeading: false,
        backgroundColor: kDarkBrown,
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.logout,
              color: kGold,
            ),
            onPressed: ()
            {
              sharedPreferences.setBool('ewishes', true);
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Login()));
            },
          ),
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      backgroundColor: kLightGold,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: ('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.download),
            label: ('Download'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: kGold,
        backgroundColor: kDarkBrown,
        unselectedItemColor: kTerracotta,
        onTap: _onItemTapped,
      ),
    );
  }
}