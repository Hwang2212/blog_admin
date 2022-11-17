import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:arrivo_web/models/models.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostInitial()) {
    on<LoadPost>((event, emit) async {
      await Future<void>.delayed(const Duration(seconds: 1));
      emit(const PostLoaded(postList: <PostModel>[]));
    });
    on<AddPost>((event, emit) {
      if (state is PostLoaded) {
        final state = this.state as PostLoaded;
        emit(PostLoaded(postList: List.from(state.postList)..add(event.post)));
      }
    });
    on<RemovePost>((event, emit) {
      if (state is PostLoaded) {
        final state = this.state as PostLoaded;
        emit(PostLoaded(
            postList: List.from(state.postList)..remove(event.post)));
      }
    });
  }
}
