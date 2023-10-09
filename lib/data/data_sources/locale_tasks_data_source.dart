import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';

import '../../app/app.dart';
import '../../core/core.dart';
import '../../domain/domain.dart';
import '../data.dart';

abstract class LocaleTasksDataSource {
  const LocaleTasksDataSource();

  Future<void> addTask({required TaskRequestDto task});

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

class LocaleTasksDataSourceImpl implements LocaleTasksDataSource {
  const LocaleTasksDataSourceImpl._internal({
    required Box<TaskRequestDto> taskBox,
    required NotificationService localNotify,
  })  : _taskBox = taskBox,
        _localNotify = localNotify;

  final Box<TaskRequestDto> _taskBox;

  final NotificationService _localNotify;

  static Future<LocaleTasksDataSourceImpl> create({
    required HiveInterface hive,
  }) async {
    final taskBox = await hive.openBox<TaskRequestDto>(
      HiveBoxes.tasksBox,
    );

    final hiveLocaleDataSource = LocaleTasksDataSourceImpl._internal(
      taskBox: taskBox,
      localNotify: GetIt.instance<NotificationService>(),
    );

    return hiveLocaleDataSource;
  }

  @override
  Future<void> addTask({required TaskRequestDto task}) async {
    await _taskBox.add(task);

    if (task.notify != null) {
      var date = task.notify;

      if ((date!.hour == 0 && date.minute == 0) &&
          (date.day == DateTime.now().day &&
              date.month == DateTime.now().month &&
              date.year == DateTime.now().year)) {
        date = DateTime.now().add(const Duration(seconds: 30));
      }
      await _localNotify.showScheduledLocalNotification(
        title: 'Напоминание о задаче',
        body: task.title,
        id: _taskBox.length - 1,
        payload: '',
        date: date,
      );
    }
  }

  @override
  Future<void> delTask({required List<int> indexes}) async {
    indexes
      ..sort((a, b) => b.compareTo(a))
      ..forEach((index) async {
        await _taskBox.deleteAt(index);
      });
  }

  @override
  Future<void> finishTasks({required List<int> indexes}) async {
    indexes.forEach((index) async {
      final task = _taskBox.values
          .elementAt(index)
          .copyWith(finish: !_taskBox.values.elementAt(index).finish);
      await _taskBox.putAt(index, task);
    });
  }

  @override
  Future<void> changeTitleTask({
    required int index,
    required String title,
  }) async {
    final task = _taskBox.values.elementAt(index);
    final updatedTask = task.copyWith(title: title);
    await _taskBox.putAt(index, updatedTask);
  }

  @override
  Future<void> changeCategoryTask({
    required int index,
    required CategoryTaskRequestDto? category,
  }) async {
    var task = _taskBox.values.elementAt(index);
    if (category == null) {
      task.deleteCategory();
    } else {
      task = task.copyWith(category: category);
    }

    await _taskBox.putAt(index, task);
  }

  @override
  Future<void> changeDateFirstTask({
    required int index,
    required DateTime? date,
  }) async {
    var task = _taskBox.values.elementAt(index);
    if (date == null) {
      task.deleteDateFirst();
    } else {
      task = task.copyWith(dateFirst: date);
    }

    await _taskBox.putAt(index, task);
  }

  @override
  Future<void> changeFinishTask({
    required int index,
    required bool finish,
  }) async {
    final task = _taskBox.values.elementAt(index);
    final updatedTask = task.copyWith(finish: finish);
    await _taskBox.putAt(index, updatedTask);
  }

  @override
  Future<void> changeLevelTask({
    required int index,
    required LevelImportance? level,
  }) async {
    var task = _taskBox.values.elementAt(index);
    if (level == null) {
      task.deleteLevel();
    } else {
      task = task.copyWith(level: level);
    }

    await _taskBox.putAt(index, task);
  }

  @override
  Future<void> changeNoteTask({
    required int index,
    required String note,
  }) async {
    final task = _taskBox.values.elementAt(index);
    final updatedTask = task.copyWith(note: note);
    await _taskBox.putAt(index, updatedTask);
  }

  @override
  Future<void> changeNotifyTask({
    required int index,
    required DateTime? notify,
  }) async {
    var task = _taskBox.values.elementAt(index);
    if (notify == null) {
      task.deleteNotify();
      await _localNotify.deleteLocalNotification(index: index);
    } else {
      task = task.copyWith(notify: notify);
      var date = notify;

      if (date.hour == 0 &&
          date.minute == 0 &&
          date.day == DateTime.now().day &&
          date.month == DateTime.now().month &&
          date.year == DateTime.now().year) {
        date = DateTime.now().add(const Duration(seconds: 30));
      }
      await _localNotify.showScheduledLocalNotification(
        title: 'Напоминание о задаче',
        body: task.title,
        id: index,
        payload: '',
        date: date,
      );
    }

    await _taskBox.putAt(index, task);
  }

  @override
  Future<void> changeSubtasksTask({
    required int index,
    required List<SubtaskRequestDto> subtasks,
  }) async {
    final task = _taskBox.values.elementAt(index);
    final updatedTask = task.copyWith(subtasks: subtasks);
    await _taskBox.putAt(index, updatedTask);
  }

  @override
  Future<void> changeDateSecondTask({
    required int index,
    required DateTime? date,
  }) async {
    var task = _taskBox.values.elementAt(index);
    if (date == null) {
      task.deleteDateSecond();
    } else {
      task = task.copyWith(dateSecond: date);
    }

    await _taskBox.putAt(index, task);
  }
}
