import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repo/auth_repo.dart';


part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.authRepoImplementation) : super(RegisterInitialState());

  final AuthRepo authRepoImplementation;

  static RegisterCubit get(context) => BlocProvider.of(context);

  void register({required String username, required String password, image}) async {
    emit(RegisterLoadingState());

    var result = await authRepoImplementation.register(username: username, password: password, image: image);
    result.fold(
            (String error) // left
        {
          emit(RegisterFailureState(error));
        },
            (r) // right
        {
          emit(RegisterSuccessState());
        });
  }
}
