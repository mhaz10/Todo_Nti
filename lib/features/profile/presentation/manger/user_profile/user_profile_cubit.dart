import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:todo_app_nti/features/profile/data/repo/user_profile_repo.dart';

part 'user_profile_state.dart';

class UserProfileCubit extends Cubit<UserProfileState> {
  UserProfileCubit(this.repo) : super(UserProfileInitialState());

  final UserProfileRepo repo;

  static UserProfileCubit get(context) => BlocProvider.of(context);

  Future<void> updateUserProfile({
    required String name,
    imagePath,
  }) async {
    var response = await repo.updateUserProfile(
      name: name,
      imagePath: imagePath,
    );

    response.fold((error) {
      emit(UserProfileFailureState(error: error));
    }, (success) {
      emit(UserProfileSuccessState(message: success));
    });
  }
}
