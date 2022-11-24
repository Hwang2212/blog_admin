part of 'comment_bloc.dart';

abstract class CommentState extends Equatable {
  const CommentState();

  @override
  List<Object> get props => [];
}

class CommentInitial extends CommentState {}

class CommentLoading extends CommentState {
  @override
  List<Object> get props => [];
}

class CommentAdded extends CommentState {
  @override
  List<Object> get props => [];
}

class CommentRemoved extends CommentState {
  @override
  List<Object> get props => [];
}

class CommentLoaded extends CommentState {
  final List<CommentModel> commentList;

  const CommentLoaded({required this.commentList});

  @override
  List<Object> get props => [commentList];
}

class CommentError extends CommentState {
  final String error;
  const CommentError(this.error);

  @override
  List<Object> get props => [error];
}
