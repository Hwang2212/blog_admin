part of 'post_bloc.dart';

abstract class PostState extends Equatable {
  const PostState();

  @override
  List<Object> get props => [];
}

class PostInitial extends PostState {}

class PostLoading extends PostState {
  @override
  List<Object> get props => [];
}

class PostAdded extends PostState {
  @override
  List<Object> get props => [];
}

class PostRemoved extends PostState {
  @override
  List<Object> get props => [];
}

class PostLoaded extends PostState {
  final List<PostModel> postList;

  const PostLoaded({required this.postList});

  @override
  List<Object> get props => [postList];
}

class PostError extends PostState {
  final String error;
  const PostError(this.error);

  @override
  List<Object> get props => [error];
}
