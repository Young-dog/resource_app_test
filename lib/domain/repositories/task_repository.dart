import '../../data/data.dart';
import '../domain.dart';

abstract class TaskRepository {
  const TaskRepository();

  Future<void> addTask({
    required String title,
    required List<SubtaskRequestDto> subtasks,
    required String? note,
    required DateTime? dateFirst,
    required DateTime? dateSecond,
    required DateTime? notify,
    required LevelImportance? level,
    required CategoryTaskRequestDto? category,
  });

  Future<void> delTask({required List<int> indexes});

  Future<void> finishTasks({required List<int> indexes});

  Future<void> changeTitleTask({
    required int index,
    required String title,
  });

  Future<void> changeNoteTask({
    required int index,
    required String note,
  });

  Future<void> changeCategoryTask({
    required int index,
    required CategoryTaskRequestDto? category,
  });

  Future<void> changeLevelTask({
    required int index,
    required LevelImportance? level,
  });

  Future<void> changeNotifyTask({
    required int index,
    required DateTime? notify,
  });

  Future<void> changeDateFirstTask({
    required int index,
    required DateTime? date,
  });

  Future<void> changeDateSecondTask({
    required int index,
    required DateTime? date,
  });

  Future<void> changeFinishTask({
    required int index,
    required bool finish,
  });

  Future<void> changeSubtasksTask({
    required int index,
    required List<SubtaskRequestDto> subtasks,
  });

}

class TaskRepositoryImpl implements TaskRepository {
  const TaskRepositoryImpl({
    required LocaleTasksDataSource localeTasksDataSource,
  }) : _localeTasksDataSource = localeTasksDataSource;

  final LocaleTasksDataSource _localeTasksDataSource;

  @override
  Future<void> addTask({
    required String title,
    required List<SubtaskRequestDto> subtasks,
    required String? note,
    required DateTime? dateFirst,
    required DateTime? dateSecond,
    required DateTime? notify,
    required LevelImportance? level,
    required CategoryTaskRequestDto? category,
  }) async {
    final task = TaskRequestDto(
      title: title,
      subtasks: subtasks,
      note: note,
      notify: notify,
      level: level,
      category: category,
      finish: false,
      dateFirst: dateFirst,
      dateSecond: dateSecond,
    );

    await _localeTasksDataSource.addTask(task: task);
  }

  @override
  Future<void> delTask({required List<int> indexes}) async {
    await _localeTasksDataSource.delTask(indexes: indexes);
  }

  @override
  Future<void> finishTasks({required List<int> indexes}) async {
    await _localeTasksDataSource.finishTasks(indexes: indexes);
  }

  @override
  Future<void> changeTitleTask({
    required int index,
    required String title,
  }) async {
    await _localeTasksDataSource.changeTitleTask(
      index: index,
      title: title,
    );
  }

  @override
  Future<void> changeCategoryTask({
    required int index,
    required CategoryTaskRequestDto? category,
  }) async {
    await _localeTasksDataSource.changeCategoryTask(
      index: index,
      category: category,
    );
  }

  @override
  Future<void> changeDateFirstTask({
    required int index,
    required DateTime? date,
  }) async {
    await _localeTasksDataSource.changeDateFirstTask(
      index: index,
      date: date,
    );
  }

  @override
  Future<void> changeFinishTask({
    required int index,
    required bool finish,
  }) async {
    await _localeTasksDataSource.changeFinishTask(
      index: index,
      finish: finish,
    );
  }

  @override
  Future<void> changeLevelTask({
    required int index,
    required LevelImportance? level,
  }) async {
    await _localeTasksDataSource.changeLevelTask(
      index: index,
      level: level,
    );
  }

  @override
  Future<void> changeNoteTask({
    required int index,
    required String note,
  }) async {
    await _localeTasksDataSource.changeNoteTask(
      index: index,
      note: note,
    );
  }

  @override
  Future<void> changeNotifyTask({
    required int index,
    required DateTime? notify,
  }) async {
    await _localeTasksDataSource.changeNotifyTask(
      index: index,
      notify: notify,
    );
  }

  @override
  Future<void> changeSubtasksTask({
    required int index,
    required List<SubtaskRequestDto> subtasks,
  }) async {
    await _localeTasksDataSource.changeSubtasksTask(
      index: index,
      subtasks: subtasks,
    );
  }

  @override
  Future<void> changeDateSecondTask({
    required int index,
    required DateTime? date,
  }) async {
    await _localeTasksDataSource.changeDateSecondTask(
      index: index,
      date: date,
    );
  }

}
