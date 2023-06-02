import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../repositories/models/users/user_update.dart';

part 'edit_profile_event.dart';

part 'edit_profile_state.dart';

class EditProfileBloc extends Bloc<EditProfileEvent, EditProfileState> {
  EditProfileBloc() : super(EditProfileInitialState()) {
    on<UploadDataProfileEvent>((event, emit) async {
      emit(EditProfileLoadingState());
      final user = event.userUpdate;
      final globalUser = FirebaseAuth.instance.currentUser;
      String? imageUrl;

      await FirebaseFirestore.instance
          .collection('users')
          .doc(globalUser!.uid)
          .update({
        'description': user.description,
        'imageAvatar': user.imageFile,
        'mail': user.mail,
        'phone': user.phone,
        'username': user.name,
      }).then((value) {
        print("User Updated");
        emit(EditProfileUpdatedState());
      }).catchError((error) {
        emit(EditProfileFailureState(failureException: error));
        print("Failed to update user: $error");
      });
    });
  }
}
