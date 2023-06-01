import 'package:flutter/material.dart';

class SaveHistories extends StatelessWidget {
  const SaveHistories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      width:55,
      height: 55,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(2.5),
        child: Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.black54,
          ),
          child: const Icon(Icons.add, size: 35,),
        ),
      ),
    );
  }
}
