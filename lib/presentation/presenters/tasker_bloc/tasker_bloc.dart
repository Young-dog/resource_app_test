import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/data.dart';
import '../../../domain/domain.dart';

part 'tasker_event.dart';

part 'tasker_state.dart';

class TaskerBloc extends Bloc<TaskerEvent, TaskerState> {
  TaskerBloc({required TaskRepository taskRepository})
      : _taskRepository = taskRepository,
        super(TaskerState.initial()) {
    on<DelTasksEvent>(_onDelTask);
    on<AddToListTaskEvent>(_onAddToListTasks);
    on<DelToListTaskEvent>(_onDelToListTasks);
    on<FinishTaskEvent>(_onFinishTasks);
    on<ChangeSelectedDateEvent>(_onChangeSelectedDate);
  }

  final TaskRepository _taskRepository;

  Future<void> _onDelTask(
    DelTasksEvent event,
    Emitter<TaskerState> emit,
  ) async {
    emit(
      state.copyWith(
        status: TaskerStatus.initial,
      ),
    );
    await _taskRepository.delTask(indexes: state.indexes);
    emit(
      state.copyWith(
        status: TaskerStatus.finish,
        indexes: [],
      ),
    );
  }

  Future<void> _onFinishTasks(
    FinishTaskEvent event,
    Emitter<TaskerState> emit,
  ) async {
    emit(
      state.copyWith(
        status: TaskerStatus.initial,
      ),
    );
    await _taskRepository.finishTasks(indexes: state.indexes);
    emit(
      state.copyWith(
        status: TaskerStatus.finish,
        indexes: [],
      ),
    );
  }

  void _onAddToListTasks(
    AddToListTaskEvent event,
    Emitter<TaskerState> emit,
  ) {
    emit(
      state.copyWith(
        status: TaskerStatus.initial,
      ),
    );

    final tasksIndex = state.indexes..add(event.index);

    emit(
      state.copyWith(
        status: TaskerStatus.added,
        indexes: tasksIndex,
      ),
    );
  }

  void _onDelToListTasks(
    DelToListTaskEvent event,
    Emitter<TaskerState> emit,
  ) {
    emit(
      state.copyWith(
        status: TaskerStatus.initial,
      ),
    );

    final tasksIndex = state.indexes..remove(event.index);

    emit(
      state.copyWith(
        status: TaskerStatus.delete,
        indexes: tasksIndex,
      ),
    );
  }

  void _onChangeSelectedDate(
    ChangeSelectedDateEvent event,
    Emitter<TaskerState> emit,
  ) {
    emit(
      state.copyWith(
        selectedDate: event.selectedDate,
      ),
    );
  }

}
