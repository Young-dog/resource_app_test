import 'package:flutter/material.dart';

class UserAvatar extends StatefulWidget {
  String imageUrl;

  UserAvatar({Key? key, required this.imageUrl}) : super(key: key);

  @override
  State<UserAvatar> createState() => _UserAvatarState();
}

class _UserAvatarState extends State<UserAvatar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 75,
      height: 75,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(3),
        child: Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.black54,
          ),
          child: Image.asset(
            widget.imageUrl,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
