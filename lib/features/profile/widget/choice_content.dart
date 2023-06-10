import 'package:flutter/material.dart';

class ChoiceContent extends StatelessWidget {
  final TabController controller;
  const ChoiceContent({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double wh = MediaQuery.of(context).size.width;

    return SizedBox(
      width: wh,
      height: 40,
      child: TabBar(
        indicatorColor: Colors.grey,
        controller: controller,
        tabs: const [
          Tab(
            text: 'Платный контент',
          ),
          Tab(
            text: 'Бесплатный контент',
          ),
        ],
      ),
    );
  }
}