import 'package:Blog_web/repositories/src/comment_repository.dart';
import 'package:Blog_web/utils/src/dropdown_values.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:Blog_web/models/models.dart';

part 'comment_event.dart';
part 'comment_state.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  final CommentRepository _commentRepository;
  CommentBloc(this._commentRepository) : super(CommentInitial()) {
    on<LoadComment>((event, emit) async {
      emit(CommentLoading());

      try {
        final comments =
            await _commentRepository.getCommentList(event.postModel.id!);
        emit(CommentLoaded(commentList: comments));
      } catch (e) {
        emit(CommentError(e.toString()));
      }
    });
    // on<AddComment>((event, emit) {
    //   if (state is CommentLoaded) {
    //     final state = this.state as CommentLoaded;
    //     emit(CommentLoaded(CommentList: List.from(state.CommentList)..add(event.Comment)));
    //   }
    // });
    on<RemoveComment>((event, emit) {
      if (state is CommentLoaded) {
        final state = this.state as CommentLoaded;
        emit(CommentLoaded(
            commentList: List.from(state.commentList)..remove(event.comment)));
      }
    });
  }
}
