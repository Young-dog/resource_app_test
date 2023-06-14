part of 'confidentiality_bloc.dart';


abstract class ConfidentialityEvent extends Equatable{
  @override
  List<Object> get props => [];
}

class ConfidentialityUpdateEvent extends ConfidentialityEvent {
  final bool conf;
  final String fieldName;
  final String data;
  final String fieldSdName;
  ConfidentialityUpdateEvent({required this.conf, required this.fieldName, required this.data, required this.fieldSdName});
}
