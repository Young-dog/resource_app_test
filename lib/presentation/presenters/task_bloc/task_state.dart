part of 'task_bloc.dart';

enum TaskStatus {
  initial,
  delDateFirst,
  delNotify,
  delDateSecond,
  delCategory,
  delLevel,
  delTime,
  success;

  bool get isLoading => this == initial;

  bool get isDelDateFirst => this == delDateFirst;

  bool get isDelTime=> this == delTime;

  bool get isDelNotify => this == delNotify;

  bool get isDelDateSecond => this == delDateSecond;

  bool get isDelCategory => this == delCategory;

  bool get isDelLevel => this == delLevel;

  bool get isSuccess => this == success;
}

class TaskState extends Equatable {
  const TaskState({
    required this.status,
    required this.title,
    required this.subtasks,
    required this.notify,
    required this.note,
    required this.category,
    required this.finish,
    this.level,
    this.dateFirst,
    this.dateSecond,
    this.time,
    required this.isRecurring,
  });

  final TaskStatus status;
  final String title;
  final List<SubtaskRequestDto> subtasks;
  final DateTime? dateFirst;
  final DateTime? dateSecond;
  final DateTime? notify;
  final String? note;
  final LevelImportance? level;
  final CategoryTaskRequestDto? category;
  final bool finish;
  final List<int> isRecurring;
  final Duration? time;

  TaskState.initial({
    String? title,
    List<SubtaskRequestDto>? subtasks,
    this.dateFirst,
    this.dateSecond,
    this.level,
    this.notify,
    this.note,
    this.category,
    this.time,
    List<int>? isRecurring,
    bool? finish,
  })  : status = TaskStatus.initial,
        title = title ?? '',
        subtasks = subtasks ?? [],
        finish = finish ?? false,
        isRecurring = isRecurring ?? [];

  TaskState copyWith({
    TaskStatus? status,
    String? title,
    List<SubtaskRequestDto>? subtasks,
    DateTime? dateFirst,
    DateTime? dateSecond,
    LevelImportance? level,
    DateTime? notify,
    String? note,
    CategoryTaskRequestDto? category,
    bool? finish,
    List<int>? isRecurring,
    Duration? time,
  }) {
    return TaskState(
      status: status ?? this.status,
      title: title ?? this.title,
      subtasks: subtasks ?? this.subtasks,
      dateFirst: status == TaskStatus.delDateFirst
          ? null
          : dateFirst ?? this.dateFirst,
      level: status == TaskStatus.delLevel ? null : level ?? this.level,
      dateSecond: status == TaskStatus.delDateFirst ||
              status == TaskStatus.delDateSecond
          ? null
          : dateSecond ?? this.dateSecond,
      notify: status == TaskStatus.delNotify ? null : notify ?? this.notify,
      note: note ?? this.note,
      category:
          status == TaskStatus.delCategory ? null : category ?? this.category,
      finish: finish ?? this.finish,
      isRecurring: isRecurring ?? this.isRecurring,
      time: status == TaskStatus.delTime ? null : time ?? this.time,
    );
  }

  @override
  List<Object?> get props => [
        status,
        time,
        title,
        subtasks,
        dateFirst,
        level,
        dateSecond,
        notify,
        note,
        category,
        finish,
        isRecurring,
      ];
}
