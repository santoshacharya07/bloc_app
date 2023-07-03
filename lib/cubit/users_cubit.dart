import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:learning_bloc/repo/user_repo.dart';

import '../models/user_model.dart';

part 'users_state.dart';

class UsersCubit extends Cubit<UsersState> {
  final UserRepo userRepo;

  UsersCubit(this.userRepo) : super(UserLoadingState());
  onLoadUsers() async {
    try {
      emit(UserLoadingState());
      var data = await userRepo.getUsers();
      emit(UserLoadedState(data));
    } catch (e) {
      emit(UserErrorState(e.toString()));
    }
  }
}
