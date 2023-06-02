import 'package:flutter/material.dart';

class UserImage extends StatefulWidget {
  final String imageUrl;

  const UserImage({Key? key, required this.imageUrl}) : super(key: key);

  @override
  State<UserImage> createState() => _UserImageState();
}

class _UserImageState extends State<UserImage> {
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 45,
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(1.5), // Border radius
        child: ClipOval(
          child: Image.network(
            widget.imageUrl,
          ),
        ),
      ),
    );
  }
}
