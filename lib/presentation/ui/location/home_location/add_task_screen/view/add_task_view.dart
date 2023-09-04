import 'package:flutter/material.dart';

class AddTaskView extends StatelessWidget {
  const AddTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    final hh = MediaQuery.of(context).size.height;
    final wh = MediaQuery.of(context).size.width;

    return Container(
      height: hh * 0.6,
      width: wh * 0.8,
      child: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: [

        ],
      ),
    );
  }
}
