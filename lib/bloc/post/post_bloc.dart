import 'dart:developer';

import 'package:Blog_web/repositories/src/post_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:Blog_web/models/models.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepository _postRepository;
  PostBloc(this._postRepository) : super(PostInitial()) {
    on<LoadPost>((event, emit) async {
      emit(PostLoading());

      try {
        final posts = await _postRepository.getpostList();
        emit(PostLoaded(postList: posts));
      } catch (e) {
        emit(PostError(e.toString()));
      }
    });
    on<AddPost>((event, emit) async {
      final post = await _postRepository.addPost(newPost: event.post);
      if (state is PostLoaded) {
        final state = this.state as PostLoaded;
        emit(PostLoaded(postList: List.from(state.postList)..add(event.post)));
      }
    });
    on<RemovePost>((event, emit) async {
      final post = await _postRepository.removePost(post: event.post);
      if (state is PostLoaded) {
        final state = this.state as PostLoaded;
        emit(PostLoaded(
            postList: List.from(state.postList)..remove(event.post)));
      }
    });
  }
}
