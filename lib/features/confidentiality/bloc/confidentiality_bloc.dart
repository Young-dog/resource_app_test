import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'confidentiality_event.dart';

part 'confidentiality_state.dart';

class ConfidentialityBloc
    extends Bloc<ConfidentialityEvent, ConfidentialityState> {
  ConfidentialityBloc() : super(ConfidentialityInitialState()) {
    on<ConfidentialityUpdateEvent>((event, emit) async {
      final bool conf = event.conf;
      final fieldName = event.fieldName;
      final data = event.data;
      final fieldSdName = event.fieldSdName;
      try {
        final globalUser = FirebaseAuth.instance.currentUser;
        await FirebaseFirestore.instance
            .collection('users')
            .doc(globalUser!.uid)
            .update({
          fieldName: {
            'conf': conf,
            fieldSdName: data,
          }
        });
      } catch (error, st) {
        emit(ConfidentialityErrorState(failureException: error));
        GetIt.I<Talker>().handle(error, st);
      }
    });
  }
}
