import 'package:dartz/dartz.dart';

import '../../../auth/data/models/login_model.dart';

abstract class HomeRepo {
  Future<Either<String, UserModel>> getUserData();
}