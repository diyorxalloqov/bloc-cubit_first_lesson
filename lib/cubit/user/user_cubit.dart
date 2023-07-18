part of 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(const UserInitialState()) {
    getUser();
  }
  UserService userService = UserService();

  //logic

  Future<void> getUser() async {
    emit(UserLoadingState());
    dynamic response = await userService.getUser();
    if (response is List<UserModel>) {
      emit(UserCompleteState(response));
    } else {
      emit(UserErrorState(response));
    }
  }

  Future<void> deleteUser() async {
    emit(UserLoadingState());
    dynamic response = await userService.deleteUser("2");
    if (response is List<UserModel>) {
      emit(UserCompleteState(response));
    } else {
      emit(UserErrorState(response));
    }
  }
}
