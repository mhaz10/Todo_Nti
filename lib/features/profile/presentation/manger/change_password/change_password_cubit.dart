import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:todo_app_nti/features/profile/data/repo/user_profile_repo.dart';

part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit(this.userProfileRepo) : super(ChangePasswordInitialState());

  final UserProfileRepo userProfileRepo;


  static ChangePasswordCubit get(context) => BlocProvider.of(context);


  Future<void> changeUserPassword ({required String oldPassWord, required String newPassWord, required String confirmPassWord}) async {
    var response = await userProfileRepo.changeUserPassword(oldPassWord: oldPassWord, newPassWord: newPassWord, confirmPassWord: confirmPassWord);

    response.fold((error) {
      emit(ChangePasswordFailureState(error: error));
    }, (success) {
      emit(ChangePasswordSuccessState(message: success));
    });
  }

}
