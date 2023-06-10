import 'package:flutter/material.dart';

import '../../../theme/style_for_text.dart';

class FollowersButtons extends StatelessWidget {
  const FollowersButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        TextButton(
          style: TextButton.styleFrom(
              splashFactory: NoSplash.splashFactory
          ),
          onPressed: () {},
          child: Column(
            children: [
              Text('223', style: styleForCountFollowersMedium,),
              Text('подписчики', style: styleForCountFollowersSmall,),
            ],
          ),
        ),
        TextButton(
          style: TextButton.styleFrom(
              splashFactory: NoSplash.splashFactory
          ),
          onPressed: () {},
          child: Column(
            children: [
              Text('223', style: styleForCountFollowersMedium,),
              Text('подписки', style: styleForCountFollowersSmall,),
            ],
          ),
        ),
      ],
    );
  }
}
