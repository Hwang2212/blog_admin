part of 'category_bloc.dart';

abstract class CategoryEvent extends Equatable {
  const CategoryEvent();

  @override
  List<Object> get props => [];
}

class LoadCategory extends CategoryEvent {}

class AddCategory extends CategoryEvent {
  final CategoryModel category;

  const AddCategory(this.category);

  @override
  List<Object> get props => [category];
}

class RemoveCategory extends CategoryEvent {
  final CategoryModel category;

  const RemoveCategory(this.category);

  @override
  List<Object> get props => [category];
}
