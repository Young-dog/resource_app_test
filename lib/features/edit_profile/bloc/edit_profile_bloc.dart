import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../repositories/models/users/user_update.dart';

part 'edit_profile_event.dart';

part 'edit_profile_state.dart';

class EditProfileBloc extends Bloc<EditProfileEvent, EditProfileState> {
  EditProfileBloc() : super(EditProfileInitialState()) {
    on<UploadDataProfileEvent>((event, emit) async {
      emit(EditProfileLoadingState());
      final user = event.userUpdate;
      final globalUser = FirebaseAuth.instance.currentUser;
      if (user.imageUrl!.isEmpty) {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(globalUser!.uid)
            .update({
          'description': user.description,
          'mail': user.mail,
          'phone': user.phone,
          'username': user.name,
        }).then((value) {
          emit(EditProfileUpdatedState(msg: 'Данные обновлены'));
        }).catchError((error) {
          emit(EditProfileFailureState(failureException: error));
        });
      } else {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(globalUser!.uid)
            .update({
          'description': user.description,
          'imageAvatar': user.imageUrl,
          'mail': user.mail,
          'phone': user.phone,
          'username': user.name,
        }).then((value) {
          emit(EditProfileUpdatedState(msg: 'Данные обновлены'));
        }).catchError((error) {
          emit(EditProfileFailureState(failureException: error));
        });
      }

    });
  }
}
