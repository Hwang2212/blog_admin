
part of 'post_bloc.dart';

abstract class PostEvent extends Equatable {
  const PostEvent();

  @override
  List<Object> get props => [];
}

class LoadPost extends PostEvent {}

class AddPost extends PostEvent {
  final PostModel post;

  const AddPost(this.post);

  @override
  List<Object> get props => [post];
}

class RemovePost extends PostEvent {
  final PostModel post;

  const RemovePost(this.post);

  @override
  List<Object> get props => [post];
}
