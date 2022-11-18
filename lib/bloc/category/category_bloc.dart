import 'package:Blog_web/repositories/src/category_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:Blog_web/models/models.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository _categoryRepository;
  CategoryBloc(this._categoryRepository) : super(CategoryInitial()) {
    on<LoadCategory>((event, emit) async {
      emit(CategoryLoading());

      try {
        final category = _categoryRepository.getCategoryList();
        emit(CategoryLoaded(categoryList: category));
      } catch (e) {
        emit(CategoryError(e.toString()));
      }
    });
    on<AddCategory>((event, emit) {
      if (state is CategoryLoaded) {
        final state = this.state as CategoryLoaded;
        emit(CategoryLoaded(
            categoryList: List.from(state.categoryList)..add(event.category)));
      }
    });
    on<RemoveCategory>((event, emit) {
      if (state is CategoryLoaded) {
        final state = this.state as CategoryLoaded;
        emit(CategoryLoaded(
            categoryList: List.from(state.categoryList)
              ..remove(event.category)));
      }
    });
  }
}
