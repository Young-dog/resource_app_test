import 'package:flutter/material.dart';

class ButtonForAuthScreen extends StatelessWidget {
  final String name;
  final VoidCallback voidCallback;
  final TextStyle theme;
  final Color color;
  final bool type;

  const ButtonForAuthScreen({
    super.key,
    required this.name,
    required this.theme,
    required this.type,
    required this.color,
    required this.voidCallback,
  });

  @override
  Widget build(BuildContext context) {
    double wh = MediaQuery.of(context).size.width;

    if (type) {
      return SizedBox(
        width: wh * 0.3,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(color),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          onPressed: voidCallback,
          child: Text(
            name,
            style: theme,
          ),
        ),
      );
    } else {
      return ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(color),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          side: MaterialStateProperty.all(
            const BorderSide(
              color: Colors.grey,
              width: 1.0,
            ),
          ),
        ),
        onPressed: voidCallback,
        child: Text(
          name,
          style: theme,
        ),
      );
    }
  }
}
