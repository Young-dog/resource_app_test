import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as fires;

// ignore: must_be_immutable
class UserAvatar extends StatefulWidget {
  final TextEditingController controller;
  String imageUrl;

  UserAvatar({Key? key, required this.imageUrl, required this.controller}) : super(key: key);

  @override
  State<UserAvatar> createState() => _UserAvatarState();
}

class _UserAvatarState extends State<UserAvatar> {
  File? _file;

  Future<void> getImage() async {
    final globalUser = FirebaseAuth.instance.currentUser;

    fires.FirebaseStorage storage = fires.FirebaseStorage
        .instance; // Создание экземпляра

    //Загружаем файл, получаем ссылку
    await storage.ref(
        "${globalUser!.uid}.data/images/avatar${UniqueKey().toString()}.png")
        .putFile(_file!)
        .then((taskSnapshot) async {
      widget.controller.text = await taskSnapshot.ref.getDownloadURL();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final piker = ImagePicker();
        piker.pickImage(source: ImageSource.gallery, imageQuality: 40).then(
          (xFile) {
            if (xFile != null) {
              _file = File(xFile.path);
              getImage();
              setState(() {});
            }
          },
        );
      },
      child: CircleAvatar(
        radius: 56,
        child: CircleAvatar(
          radius: 56,
          backgroundImage: _file == null ? NetworkImage(widget.imageUrl) : FileImage(_file!) as ImageProvider,
        ),
      ),
    );
  }
}
