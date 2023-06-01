import 'package:flutter/material.dart';

// ignore: must_be_immutable
class UserAvatar extends StatefulWidget {
  String imageUrl;

  UserAvatar({Key? key, required this.imageUrl}) : super(key: key);

  @override
  State<UserAvatar> createState() => _UserAvatarState();
}

class _UserAvatarState extends State<UserAvatar> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
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
            child: Image.network(
              widget.imageUrl,
            ),
          ),
        ),
      ),
    );
  }
}
