import 'package:flutter/material.dart';
import 'package:resourse_app/features/profile/view/view.dart';
import 'package:resourse_app/features/reels/view/view.dart';

class HomePage extends StatelessWidget {
  static const String id = 'home_page';
  HomePage({Key? key}) : super(key: key);




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('username'),),
      body: ListView(),
    );
  }
}
