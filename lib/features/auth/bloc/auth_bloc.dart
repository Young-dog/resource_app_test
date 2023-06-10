import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resourse_app/repositories/models/users/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitialState()) {
    final auth = FirebaseAuth.instance;

    String imageUrl =
        'https://firebasestorage.googleapis.com/v0/b/resourse-app.appspot.com/o/default%2Favatar%2Fprofile.png?alt=media&token=5d028fea-d196-484c-ad8e-ea4014c23e60&_gl=1*1tl60l2*_ga*NTQxOTcxMDAuMTY4MzYzOTQxOA..*_ga_CW55HF8NVT*MTY4NTQzMDc1MS4xMS4xLjE2ODU0MzE1NTcuMC4wLjA.';
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
      try {// Создание экземпляра
        final user = event.user;
        final UserCredential userCredential =
            await auth.createUserWithEmailAndPassword(
                email: event.user.mail, password: event.user.password);

        await FirebaseFirestore.instance
            .collection('users')
            .doc(userCredential.user!.uid)
            .set({
          'userId': user.uniqueId,
          'mail': user.mail,
          'username': user.username,
          'description': user.description,
          'phone' : user.phone,
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
      }
    });
    on<AuthLogOutEvent>((event, emit) async {
      emit(AuthLoadingState());
      await FirebaseAuth.instance.signOut();
      emit(AuthInitialState());
    });
  }
}
