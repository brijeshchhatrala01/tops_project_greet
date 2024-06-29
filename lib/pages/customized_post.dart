
import 'package:flutter/material.dart';

import 'user/constant.dart';



class Customized extends StatefulWidget{
  const Customized({super.key});

  @override
  State<StatefulWidget> createState() {
    return CustomizedPage();
  }
}

class CustomizedPage extends State<Customized> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Post'.toUpperCase(),style: const TextStyle(fontStyle: FontStyle.italic)),
        backgroundColor: kGold,
      ),
      body: const Center(
        child: Text("Coming Soon ...",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,fontStyle: FontStyle.italic,color: kBrown)),
      ),
    );
  }
}