part of 'comment_bloc.dart';

abstract class CommentEvent extends Equatable {
  const CommentEvent();

  @override
  List<Object> get props => [];
}

class LoadComment extends CommentEvent {
  final PostModel postModel;

  const LoadComment(this.postModel);
}

class AddComment extends CommentEvent {
  final CommentModel comment;

  const AddComment(this.comment);

  @override
  List<Object> get props => [comment];
}

class RemoveComment extends CommentEvent {
  final CommentModel comment;

  const RemoveComment(this.comment);

  @override
  List<Object> get props => [comment];
}
