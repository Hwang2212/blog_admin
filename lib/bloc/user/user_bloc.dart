import 'package:Blog_web/models/src/user_model.dart';
import 'package:Blog_web/repositories/repositories.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository _userRepository;
  UserBloc(this._userRepository) : super(UserInitial()) {
    on<LoadUser>((event, emit) async {
      emit(UserLoading());

      try {
        final users = _userRepository.getUserList();
        emit(UserLoaded(userList: users));
      } catch (e) {
        emit(UserError(e.toString()));
      }
    });

    on<AddUser>((event, emit) async {
      try {
        if (state is UserLoaded) {
          final state = this.state as UserLoaded;
          emit(
              UserLoaded(userList: List.from(state.userList)..add(event.user)));
        }
      } catch (e) {
        emit(UserError(e.toString()));
      }
    });

    on<RemoveUser>((event, emit) async {
      try {
        if (state is UserLoaded) {
          final state = this.state as UserLoaded;
          emit(UserLoaded(
              userList: List.from(state.userList)..remove(event.user)));
        }
      } catch (e) {
        emit(UserError(e.toString()));
      }
    });
  }
}
