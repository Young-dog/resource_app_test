import 'package:flutter/material.dart';
import '../../auth/widgets/button_for_auth_screen.dart';
import '../../../theme/style_for_text.dart';

class ShowBottomMsg {
  void show({
    required BuildContext ctx,
    required String msg,
    required String buttonName,
    required int countPop,
  }) {
    showModalBottomSheet(
        elevation: 10,
        backgroundColor: Colors.transparent,
        context: ctx,
        builder: (ctx) => Container(
              width: 300,
              height: 250,
              color: const Color(0xFF131515),
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    msg,
                    style: styleForCountFollowersMedium,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ButtonForAuthScreen(
                    name: buttonName,
                    color: Colors.transparent,
                    voidCallback: () {
                      int count = 0;
                      Navigator.of(ctx).pop();
                      Navigator.of(ctx).pop();
                    },
                    type: false,
                    theme: styleForButtonAuth,
                  ),
                ],
              ),
            ));
  }
}
