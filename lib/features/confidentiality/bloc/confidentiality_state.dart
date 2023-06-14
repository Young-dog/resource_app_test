part of 'confidentiality_bloc.dart';


abstract class ConfidentialityState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ConfidentialityInitialState extends ConfidentialityState {}

class ConfidentialityLoadingState extends ConfidentialityState {}

class ConfidentialityUpdatedState extends ConfidentialityState {}

class ConfidentialityErrorState extends ConfidentialityState {
  final Object failureException;

  ConfidentialityErrorState({required this.failureException});

  @override
  List<Object?> get props => [failureException];
}
