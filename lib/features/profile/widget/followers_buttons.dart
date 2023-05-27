import 'package:flutter/material.dart';

class FollowersButtons extends StatelessWidget {
  const FollowersButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double wh = MediaQuery.of(context).size.width;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        TextButton(
          onPressed: () {},
          child: const Column(
            children: [
              Text('223'),
              Text('подписчики'),
            ],
          ),
        ),
        TextButton(
          onPressed: () {},
          child: const Column(
            children: [
              Text('223'),
              Text('подписки'),
            ],
          ),
        ),
      ],
    );
  }
}
