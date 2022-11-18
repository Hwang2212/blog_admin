part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class UserLoading extends UserState {
  @override
  List<Object> get props => [];
}

class UserAdded extends UserState {
  @override
  List<Object> get props => [];
}

class UserRemoved extends UserState {
  @override
  List<Object> get props => [];
}

class UserLoaded extends UserState {
  final List<UserModel> userList;

  const UserLoaded({required this.userList});

  @override
  List<Object> get props => [userList];
}

class UserError extends UserState {
  final String error;
  const UserError(this.error);

  @override
  List<Object> get props => [error];
}
