part of 'category_bloc.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object> get props => [];
}

class CategoryInitial extends CategoryState {}

class CategoryLoading extends CategoryState {
  @override
  List<Object> get props => [];
}

class CategoryAdded extends CategoryState {
  @override
  List<Object> get props => [];
}

class CategoryRemoved extends CategoryState {
  @override
  List<Object> get props => [];
}

class CategoryLoaded extends CategoryState {
  final List<CategoryModel> categoryList;

  const CategoryLoaded({required this.categoryList});

  @override
  List<Object> get props => [categoryList];
}

class CategoryError extends CategoryState {
  final String error;
  const CategoryError(this.error);

  @override
  List<Object> get props => [error];
}
