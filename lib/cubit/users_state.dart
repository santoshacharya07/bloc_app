part of 'users_cubit.dart';

abstract class UsersState extends Equatable {
  const UsersState();
  @override
  List<Object> get props => [];
}

class UsersInitial extends UsersState {}

class UserLoadingState extends UsersState {}

class UserLoadedState extends UsersState {
  final List<UserModel> userModel;

  const UserLoadedState(this.userModel);
  @override
  List<Object> get props => [userModel];
}

class UserErrorState extends UsersState {
  final String errorMessage;

  const UserErrorState(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];
}
