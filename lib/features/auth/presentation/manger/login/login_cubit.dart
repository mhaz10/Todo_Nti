import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:todo_app_nti/features/auth/data/repo/auth_repo_implemation.dart';

import '../../../data/models/login_model.dart';
import '../../../data/repo/auth_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepoImplementation) : super(LoginInitialState());

  final AuthRepo authRepoImplementation;

  static LoginCubit get(context) => BlocProvider.of(context);

  void login({required String username, required String password}) async {
    emit(LoginLoadingState());
    var result = await authRepoImplementation.login(username: username, password: password);
    result.fold((error)
    {
      emit(LoginFailureState(error.toString()));
    }, (userModel) {
      emit(LoginSuccessState(userModel));
    }
    );
  }

}
