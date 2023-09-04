import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../app/app.dart';
import '../../../../app/asset_names.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    required this.pageController,
    super.key,
  });

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    final wh = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);

    return SizedBox(
      width: wh,
      height: theme.spacings.x20,
      child: Stack(
        children: [
          CustomPaint(
            size: Size(wh, theme.spacings.x15),
            painter: BNBCustomPointer(),
          ),
          Center(
            heightFactor: 0,
            child: ClipOval(
              child: FloatingActionButton(
                onPressed: () {
                },
                backgroundColor: theme.palette.buttonPrimary,
                child: const Icon(Icons.add),
              ),
            ),
          ),
          SizedBox(
            width: wh,
            height: theme.spacings.x20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    pageController.jumpToPage(0,
                    );
                  },
                  icon: SvgPicture.asset(
                    AssetNames.tasksIcon,
                    color: theme.palette.buttonPrimary,
                    height: theme.spacings.x10,
                    width: theme.spacings.x10,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    pageController.jumpToPage(1,
                    );
                  },
                  icon: SvgPicture.asset(
                    AssetNames.calendarIcon,
                    color: theme.palette.buttonPrimary,
                    height: theme.spacings.x10,
                    width: theme.spacings.x10,
                  ),
                ),
                SizedBox(
                  width: wh * 0.20,
                ),
                IconButton(
                  onPressed: () {
                    pageController.jumpToPage(2,
                    );
                  },
                  icon: SvgPicture.asset(
                    AssetNames.chatIcon,
                    color: theme.palette.buttonPrimary,
                    height: theme.spacings.x10,
                    width: theme.spacings.x10,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    pageController.jumpToPage(3,
                    );
                  },
                  icon: SvgPicture.asset(
                    AssetNames.settingsIcon,
                    color: theme.palette.buttonPrimary,
                    height: theme.spacings.x10,
                    width: theme.spacings.x10,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BNBCustomPointer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.transparent
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, 0)
      ..quadraticBezierTo(size.width * 0.20, 0, size.width * 0.40, 0)
      ..quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 0)
      ..arcToPoint(
        Offset(size.width * 0.60, 0),
        radius: const Radius.circular(10),
        clockwise: false,
      )
      ..quadraticBezierTo(size.width * 0.60, 0, size.width * 0.70, 0)
      ..quadraticBezierTo(size.width * 0.70, 0, size.width * 1, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
