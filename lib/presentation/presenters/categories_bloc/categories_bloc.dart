import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/data.dart';
import '../../../domain/domain.dart';

part 'categories_event.dart';

part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  CategoriesBloc({required CategoriesRepository categoriesRepository})
      : _categoriesRepository = categoriesRepository,
        super(const CategoriesState.initial()) {
    on<ChangeNameEvent>(_changeName);
    on<ChangeColorEvent>(_changeColor);
    on<AddCategoryEvent>(_addCategory);
    on<DelCategoryEvent>(_delCategory);
  }

  final CategoriesRepository _categoriesRepository;

  void _changeName(
    ChangeNameEvent event,
    Emitter<CategoriesState> emit,
  ) {
    emit(
      state.copyWith(name: event.name),
    );
  }

  void _changeColor(
    ChangeColorEvent event,
    Emitter<CategoriesState> emit,
  ) {
    emit(
      state.copyWith(color: event.color),
    );
  }

  Future<void> _addCategory(
    AddCategoryEvent event,
    Emitter<CategoriesState> emit,
  ) async {
    if (state.name == null) {
      return;
    }

    await _categoriesRepository.addCategory(
      name: state.name!,
      color: state.color,
    );

    emit(
      state.copyWith(
        name: null,
      ),
    );
  }

  Future<void> _delCategory(
    DelCategoryEvent event,
    Emitter<CategoriesState> emit,
  ) async {
    await _categoriesRepository.delCategory(index: event.index);
  }
}
