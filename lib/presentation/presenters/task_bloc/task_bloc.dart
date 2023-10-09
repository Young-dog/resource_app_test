import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/data.dart';
import '../../../domain/domain.dart';

part 'task_event.dart';

part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc({
    required TaskRepository taskRepository,
    String? title,
    List<SubtaskRequestDto>? subtasks,
    DateTime? dateFirst,
    DateTime? dateSecond,
    LevelImportance? level,
    DateTime? notify,
    String? note,
    CategoryTaskRequestDto? category,
    bool? finish,
  })  : _taskRepository = taskRepository,
        super(
          TaskState.initial(
            title: title,
            subtasks: subtasks,
            dateFirst: dateFirst,
            dateSecond: dateSecond,
            level: level,
            notify: notify,
            note: note,
            category: category,
            finish: finish,
          ),
        ) {
    on<AddTitleTaskEvent>(_onAddTitle);
    on<AddSubtaskEvent>(_onAddSubtasks);
    on<AddNoteEvent>(_onAddNote);
    on<AddDateFirstEvent>(_onAddDateFirst);
    on<AddDateSecondEvent>(_onAddDateSecond);
    on<AddNotifyEvent>(_onAddNotify);
    on<AddLevelTaskEvent>(_onAddLevel);
    on<AddCategoryTaskEvent>(_onAddCategory);
    on<ChangeSubtasksEvent>(_onChangeSubtasks);
    on<AddLocalTaskEvent>(_onAddTask);
    on<ChangeTaskTitleEvent>(_onChangeTaskTitle);
    on<ChangeTaskNoteEvent>(_onChangeTaskNote);
    on<ChangeTaskLevelEvent>(_onChangeTaskLevel);
    on<ChangeTaskCategoryEvent>(_onChangeTaskCategory);
    on<ChangeTaskDateFirstEvent>(_onChangeTaskDateFirst);
    on<ChangeTaskDateSecondEvent>(_onChangeDateSecond);
    on<ChangeTaskNotifyEvent>(_onChangeTaskNotify);
    on<ChangeTaskFinishEvent>(_onChangeTaskFinish);
    on<ChangeTaskSubtasksAddEvent>(_onAddTaskSubtasks);
    on<ChangeTaskSubtasksEvent>(_onChangeTaskSubtasks);
  }

  final TaskRepository _taskRepository;

  void _onAddCategory(
    AddCategoryTaskEvent event,
    Emitter<TaskState> emit,
  ) {
    if (event.category.color == null) {
      emit(
        state.copyWith(
          status: TaskStatus.delCategory,
        ),
      );
    } else {
      emit(
        state.copyWith(
          category: event.category,
        ),
      );
    }
    emit(
      state.copyWith(
        status: TaskStatus.success,
      ),
    );
  }

  void _onChangeSubtasks(
    ChangeSubtasksEvent event,
    Emitter<TaskState> emit,
  ) {
    final subtasks = state.subtasks;

    subtasks[event.index] = event.subtask;

    emit(
      state.copyWith(
        subtasks: subtasks,
      ),
    );
  }

  void _onAddTitle(
    AddTitleTaskEvent event,
    Emitter<TaskState> emit,
  ) {
    emit(
      state.copyWith(
        title: event.title,
      ),
    );
  }

  void _onAddSubtasks(
    AddSubtaskEvent event,
    Emitter<TaskState> emit,
  ) {
    final subtasks = state.subtasks;

    final subtask = SubtaskRequestDto(
      title: event.title,
      finish: event.finish,
    );

    subtasks.add(subtask);

    emit(
      state.copyWith(
        subtasks: subtasks,
      ),
    );
  }

  void _onAddNote(
    AddNoteEvent event,
    Emitter<TaskState> emit,
  ) {
    emit(
      state.copyWith(
        note: event.note,
      ),
    );
  }

  void _onAddNotify(
    AddNotifyEvent event,
    Emitter<TaskState> emit,
  ) {
    if (event.notify == null) {
      emit(
        state.copyWith(
          status: TaskStatus.delNotify,
        ),
      );
    } else {
      emit(
        state.copyWith(
          notify: event.notify,
        ),
      );
    }
    emit(
      state.copyWith(
        status: TaskStatus.success,
      ),
    );
  }

  void _onAddDateFirst(
    AddDateFirstEvent event,
    Emitter<TaskState> emit,
  ) {
    if (event.date == null) {
      emit(
        state.copyWith(
          status: TaskStatus.delDateFirst,
          dateFirst: event.date,
        ),
      );
      emit(
        state.copyWith(
          status: TaskStatus.success,
        ),
      );
    } else {
      emit(
        state.copyWith(
          dateFirst: event.date,
        ),
      );
    }
  }

  void _onAddDateSecond(
    AddDateSecondEvent event,
    Emitter<TaskState> emit,
  ) {
    if (event.date == null) {
      emit(
        state.copyWith(
          status: TaskStatus.delDateSecond,
          dateSecond: event.date,
        ),
      );
      emit(
        state.copyWith(
          status: TaskStatus.success,
        ),
      );
    } else {
      emit(
        state.copyWith(
          dateSecond: event.date,
        ),
      );
    }
  }

  void _onAddLevel(
    AddLevelTaskEvent event,
    Emitter<TaskState> emit,
  ) {
    if (event.level == null) {
      emit(
        state.copyWith(
          status: TaskStatus.delLevel,
        ),
      );
    } else {
      emit(
        state.copyWith(
          level: event.level,
        ),
      );
    }
    emit(
      state.copyWith(
        status: TaskStatus.success,
      ),
    );
  }

  Future<void> _onAddTask(
    AddLocalTaskEvent event,
    Emitter<TaskState> emit,
  ) async {
    await _taskRepository.addTask(
      title: state.title,
      subtasks: state.subtasks,
      note: state.note,
      dateFirst: state.dateFirst,
      notify: state.notify,
      dateSecond: state.dateSecond,
      level: state.level,
      category: state.category,
    );
  }

  Future<void> _onChangeTaskTitle(
    ChangeTaskTitleEvent event,
    Emitter<TaskState> emit,
  ) async {
    emit(
      state.copyWith(
        title: event.title,
      ),
    );

    await _taskRepository.changeTitleTask(
      index: event.index,
      title: event.title,
    );
  }

  Future<void> _onChangeTaskNote(
    ChangeTaskNoteEvent event,
    Emitter<TaskState> emit,
  ) async {
    emit(
      state.copyWith(
        note: event.note,
      ),
    );

    await _taskRepository.changeNoteTask(
      index: event.index,
      note: event.note,
    );
  }

  Future<void> _onChangeTaskLevel(
    ChangeTaskLevelEvent event,
    Emitter<TaskState> emit,
  ) async {
    if (event.level == null) {
      emit(
        state.copyWith(
          status: TaskStatus.delLevel,
        ),
      );
    } else {
      emit(
        state.copyWith(
          level: event.level,
        ),
      );
    }

    await _taskRepository.changeLevelTask(
      index: event.index,
      level: event.level,
    );

    emit(
      state.copyWith(
        status: TaskStatus.success,
      ),
    );
  }

  Future<void> _onChangeTaskCategory(
    ChangeTaskCategoryEvent event,
    Emitter<TaskState> emit,
  ) async {
    if (event.category.color == null) {
      emit(
        state.copyWith(
          status: TaskStatus.delCategory,
        ),
      );
    } else {
      emit(
        state.copyWith(
          category: event.category,
        ),
      );
    }
    await _taskRepository.changeCategoryTask(
      index: event.index,
      category: event.category,
    );

    emit(
      state.copyWith(
        status: TaskStatus.success,
      ),
    );
  }

  Future<void> _onChangeTaskDateFirst(
    ChangeTaskDateFirstEvent event,
    Emitter<TaskState> emit,
  ) async {
    if (event.date == null) {
      emit(
        state.copyWith(
          status: TaskStatus.delDateFirst,
          dateFirst: event.date,
        ),
      );
    } else {
      emit(
        state.copyWith(
          dateFirst: event.date,
        ),
      );
    }

    await _taskRepository.changeDateFirstTask(
      index: event.index,
      date: event.date,
    );

    emit(
      state.copyWith(
        status: TaskStatus.success,
      ),
    );
  }

  Future<void> _onChangeDateSecond(
    ChangeTaskDateSecondEvent event,
    Emitter<TaskState> emit,
  ) async {
    if (event.date == null) {
      emit(
        state.copyWith(
          status: TaskStatus.delDateSecond,
          dateSecond: event.date,
        ),
      );
    } else {
      emit(
        state.copyWith(
          dateSecond: event.date,
        ),
      );
    }

    await _taskRepository.changeDateSecondTask(
      index: event.index,
      date: event.date,
    );

    emit(
      state.copyWith(
        status: TaskStatus.success,
      ),
    );
  }

  Future<void> _onChangeTaskNotify(
    ChangeTaskNotifyEvent event,
    Emitter<TaskState> emit,
  ) async {
    if (event.notify == null) {
      emit(
        state.copyWith(
          status: TaskStatus.delNotify,
        ),
      );
    } else {
      emit(
        state.copyWith(
          notify: event.notify,
        ),
      );
    }

    await _taskRepository.changeNotifyTask(
      index: event.index,
      notify: event.notify,
    );

    emit(
      state.copyWith(
        status: TaskStatus.success,
      ),
    );
  }

  Future<void> _onChangeTaskFinish(
    ChangeTaskFinishEvent event,
    Emitter<TaskState> emit,
  ) async {
    emit(
      state.copyWith(
        finish: event.finish,
      ),
    );

    await _taskRepository.changeFinishTask(
      index: event.index,
      finish: event.finish,
    );
  }

  Future<void> _onAddTaskSubtasks(
    ChangeTaskSubtasksAddEvent event,
    Emitter<TaskState> emit,
  ) async {
    final subtasks = state.subtasks;

    final subtask = SubtaskRequestDto(
      title: event.title,
      finish: event.finish,
    );

    subtasks.add(subtask);

    emit(
      state.copyWith(
        subtasks: subtasks,
      ),
    );

    await _taskRepository.changeSubtasksTask(
      index: event.index,
      subtasks: subtasks,
    );
  }

  Future<void> _onChangeTaskSubtasks(
    ChangeTaskSubtasksEvent event,
    Emitter<TaskState> emit,
  ) async {
    final subtasks = state.subtasks;

    subtasks[event.index] = event.subtask;

    emit(
      state.copyWith(
        subtasks: subtasks,
      ),
    );

    await _taskRepository.changeSubtasksTask(
      index: event.indexTask,
      subtasks: subtasks,
    );
  }
}
