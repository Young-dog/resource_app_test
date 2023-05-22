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
    FirebaseAuth auth = FirebaseAuth.instance;
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
      print("Переданный $state");
    });
    on<AuthSignUpEvent>((event, emit) async {
      emit(AuthLoadingState());
      try {
        final user = event.user;
        final UserCredential userCredential =
            await auth.createUserWithEmailAndPassword(
                email: event.user.login, password: event.user.password);

        await FirebaseFirestore.instance
            .collection('users')
            .doc(userCredential.user!.uid)
            .set({
          'userId': userCredential.user!.uid,
          'mail' : user.login,
          'username' : user.username,
        });
        emit(AuthLogInState());
        print(state);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          emit(AuthFailureState(
              failureException: 'The password provided is too weak.'));
          print(state);
        } else if (e.code == 'email-already-in-use') {
          emit(AuthFailureState(
              failureException: 'The account already exists for that email.'));
          print(state);
        }
      } catch (error) {
        emit(AuthFailureState(failureException: error));
        print(state);
      }
    });
  }
}
