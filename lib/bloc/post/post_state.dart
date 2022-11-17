part of 'post_bloc.dart';

abstract class PostState extends Equatable {
  const PostState();

  @override
  List<Object> get props => [];
}

class PostInitial extends PostState {}

class PostLoaded extends PostState {
  final List<PostModel> postList;

  const PostLoaded({required this.postList});

  @override
  List<Object> get props => [postList];
}
