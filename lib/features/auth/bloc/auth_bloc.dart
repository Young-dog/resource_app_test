import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resourse_app/repositories/models/users/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as fires;

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitialState()) {
    final auth = FirebaseAuth.instance;

    String? imageUrl;
    on<AuthSignInEvent>((event, emit) async {
      emit(AuthLoadingState());
      try {
        final user = event.user;
        await auth.signInWithEmailAndPassword(
            email: user.login, password: user.password);
        emit(AuthLogInState());
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          emit(AuthFailureState(
              failureException: 'No user found for that email.'));
        } else if (e.code == 'wrong-password') {
          emit(AuthFailureState(
              failureException: 'Wrong password provided for that user.'));
        }
      } catch (error) {
        emit(AuthFailureState(failureException: error));
      }
    });
    on<AuthSignUpEvent>((event, emit) async {
      emit(AuthLoadingState());
      try {
        fires.FirebaseStorage storage = fires.FirebaseStorage.instance; // Создание экземпляра
        final user = event.user;
        final UserCredential userCredential =
            await auth.createUserWithEmailAndPassword(
                email: event.user.login, password: event.user.password);

        File userAvatar = await File(user.avatar).create();

          await storage.ref("data/${userCredential.user!.uid}/avatar/${UniqueKey().toString()}.png").putFile(userAvatar).then((taskSnapshot) async {
            imageUrl = await taskSnapshot.ref.getDownloadURL();
          });

        await FirebaseFirestore.instance
            .collection('users')
            .doc(userCredential.user!.uid)
            .set({
          'userId': userCredential.user!.uid,
          'mail' : user.login,
          'username' : user.username,
          'description' : '',
          'imageAvatar': imageUrl,
        });
        emit(AuthLogInState());
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          emit(AuthFailureState(
              failureException: 'The password provided is too weak.'));
        } else if (e.code == 'email-already-in-use') {
          emit(AuthFailureState(
              failureException: 'The account already exists for that email.'));
        }
      } catch (error) {
        emit(AuthFailureState(failureException: error));
        print(error);
      }
    });
    on<AuthLogOutEvent>((event, emit) async {
      emit(AuthLoadingState());
      await FirebaseAuth.instance.signOut();
      emit(AuthInitialState());
    });
  }
}
