part of 'tasker_bloc.dart';

abstract class TaskerEvent extends Equatable {
  const TaskerEvent();

  @override
  List<Object?> get props => [];
}

class DelTasksEvent extends TaskerEvent {
  const DelTasksEvent();
}

class FinishTaskEvent extends TaskerEvent {
  const FinishTaskEvent();
}

class AddToListTaskEvent extends TaskerEvent {
  const AddToListTaskEvent({required this.index});

  final int index;

  @override
  List<Object?> get props => [
        index,
      ];
}

class DelToListTaskEvent extends TaskerEvent {
  const DelToListTaskEvent({required this.index});

  final int index;

  @override
  List<Object?> get props => [
        index,
      ];
}

class ChangeSelectedDateEvent extends TaskerEvent {
  const ChangeSelectedDateEvent({
    required this.selectedDate,
  });

  final DateTime selectedDate;

  @override
  List<Object?> get props => [
        selectedDate,
      ];
}
