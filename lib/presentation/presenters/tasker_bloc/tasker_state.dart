part of 'tasker_bloc.dart';

enum TaskerStatus {
  initial,
  editTask,
  delete,
  added,
  finish,
  success;

  bool get isInitial => this == initial;

  bool get isEditTask => this == editTask;

  bool get isSuccess => this == success;

  bool get isDelete => this == delete;

  bool get isAdded => this == added;

  bool get isFinish => this == finish;
}

class TaskerState extends Equatable {
  const TaskerState({
    required this.status,
    required this.indexes,
    required this.isShadow,
    required this.selectedDate,
  });

  TaskerState.initial()
      : status = TaskerStatus.initial,
        indexes = <int>[],
        isShadow = false,
        selectedDate = DateTime.now();

  final TaskerStatus status;

  final List<int> indexes;

  final bool isShadow;

  final DateTime selectedDate;

  TaskerState copyWith({
    TaskerStatus? status,
    List<int>? indexes,
    bool? isShadow,
    TaskRequestDto? currentTask,
    DateTime? selectedDate,
  }) {
    return TaskerState(
      status: status ?? this.status,
      indexes: indexes ?? this.indexes,
      isShadow: isShadow ?? this.isShadow,
      selectedDate: selectedDate ?? this.selectedDate,
    );
  }

  @override
  List<Object?> get props => [
        status,
        indexes,
        isShadow,
        selectedDate,
      ];
}
