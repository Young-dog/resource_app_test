part of 'task_bloc.dart';

abstract class TaskEvent extends Equatable {
  const TaskEvent();

  @override
  List<Object?> get props => [];
}

class AddTitleTaskEvent extends TaskEvent {
  const AddTitleTaskEvent({
    required this.title,
  });

  final String title;

  @override
  List<Object?> get props => [
        title,
      ];
}

class AddSubtaskEvent extends TaskEvent {
  const AddSubtaskEvent({
    required this.title,
    required this.finish,
  });

  final String title;
  final bool finish;

  @override
  List<Object?> get props => [
        title,
        finish,
      ];
}

class AddNotifyEvent extends TaskEvent {
  const AddNotifyEvent({
    required this.notify,
  });

  final DateTime? notify;

  @override
  List<Object?> get props => [
        notify,
      ];
}

class AddDateFirstEvent extends TaskEvent {
  const AddDateFirstEvent({
    required this.date,
  });

  final DateTime? date;

  @override
  List<Object?> get props => [
        date,
      ];
}

class AddDateSecondEvent extends TaskEvent {
  const AddDateSecondEvent({
    required this.date,
  });

  final DateTime? date;

  @override
  List<Object?> get props => [
        date,
      ];
}

class AddNoteEvent extends TaskEvent {
  const AddNoteEvent({
    required this.note,
  });

  final String note;

  @override
  List<Object?> get props => [
        note,
      ];
}

class AddLevelTaskEvent extends TaskEvent {
  const AddLevelTaskEvent({required this.level});

  final LevelImportance? level;

  @override
  List<Object?> get props => [
        level,
      ];
}

class AddCategoryTaskEvent extends TaskEvent {
  const AddCategoryTaskEvent({
    required this.category,
  });

  final CategoryTaskRequestDto category;

  @override
  List<Object?> get props => [
        category,
      ];
}

class AddLocalTaskEvent extends TaskEvent {
  const AddLocalTaskEvent();
}

class ChangeSubtasksEvent extends TaskEvent {
  const ChangeSubtasksEvent({
    required this.subtask,
    required this.index,
  });

  final SubtaskRequestDto subtask;
  final int index;

  @override
  List<Object?> get props => [
        subtask,
        index,
      ];
}

class ChangeTaskTitleEvent extends TaskEvent {
  const ChangeTaskTitleEvent({
    required this.title,
    required this.index,
  });

  final String title;
  final int index;

  @override
  List<Object?> get props => [
        title,
        index,
      ];
}

class ChangeTaskNoteEvent extends TaskEvent {
  const ChangeTaskNoteEvent({
    required this.note,
    required this.index,
  });

  final String note;
  final int index;

  @override
  List<Object?> get props => [
        note,
        index,
      ];
}

class ChangeTaskLevelEvent extends TaskEvent {
  const ChangeTaskLevelEvent({
    required this.level,
    required this.index,
  });

  final LevelImportance? level;
  final int index;

  @override
  List<Object?> get props => [
        level,
        index,
      ];
}

class ChangeTaskCategoryEvent extends TaskEvent {
  const ChangeTaskCategoryEvent({
    required this.category,
    required this.index,
  });

  final CategoryTaskRequestDto category;
  final int index;

  @override
  List<Object?> get props => [
        category,
        index,
      ];
}

class ChangeTaskDateFirstEvent extends TaskEvent {
  const ChangeTaskDateFirstEvent({
    required this.date,
    required this.index,
  });

  final DateTime? date;
  final int index;

  @override
  List<Object?> get props => [
        date,
        index,
      ];
}

class ChangeTaskDateSecondEvent extends TaskEvent {
  const ChangeTaskDateSecondEvent({
    required this.date,
    required this.index,
  });

  final DateTime? date;
  final int index;

  @override
  List<Object?> get props => [
        date,
        index,
      ];
}

class ChangeTaskNotifyEvent extends TaskEvent {
  const ChangeTaskNotifyEvent({
    required this.notify,
    required this.index,
  });

  final DateTime? notify;
  final int index;

  @override
  List<Object?> get props => [
        notify,
        index,
      ];
}

class ChangeTaskFinishEvent extends TaskEvent {
  const ChangeTaskFinishEvent({
    required this.finish,
    required this.index,
  });

  final bool finish;
  final int index;

  @override
  List<Object?> get props => [
        finish,
        index,
      ];
}

class ChangeTaskSubtasksAddEvent extends TaskEvent {
  const ChangeTaskSubtasksAddEvent({
    required this.title,
    required this.finish,
    required this.index,
  });

  final String title;
  final bool finish;
  final int index;

  @override
  List<Object?> get props => [
        title,
        finish,
        index,
      ];
}

class ChangeTaskSubtasksEvent extends TaskEvent {
  const ChangeTaskSubtasksEvent({
    required this.subtask,
    required this.index,
    required this.indexTask,
  });

  final SubtaskRequestDto subtask;
  final int index;
  final int indexTask;

  @override
  List<Object?> get props => [
        subtask,
        index,
        indexTask,
      ];
}
