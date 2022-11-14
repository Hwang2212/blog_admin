part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  UserModel get props => UserModel();
}

class UserInitial extends UserState {}

class UserLoaded extends UserState {
  final UserModel userModel;

  const UserLoaded({required this.userModel});

  @override
  UserModel get props => userModel;
}
