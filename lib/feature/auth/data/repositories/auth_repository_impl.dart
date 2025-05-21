import 'package:fpdart/fpdart.dart';
import 'package:news_app/core/errors/failure.dart';
import 'package:news_app/feature/auth/data/datasoruces/auth_remote_datasources.dart';
import 'package:news_app/feature/auth/domain/entities/user_entity.dart';
import 'package:news_app/feature/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasources authRemoteDatasources;
  AuthRepositoryImpl({required this.authRemoteDatasources});

  @override
  Future<Either<Failure, UserEntity>> signin({
    required String email,
    required String password,
  }) async {
    try {
      final userModel = await authRemoteDatasources.signin(
        email: email,
        password: password,
      );
      print("repository impl successs");

      // Success: Wrap the result in Right
      return Right(userModel);
    } catch (e) {
      print("repository impl errrorrrr");
      // Failure: Wrap the error in Left
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signup({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final result = await authRemoteDatasources.signup(
        name: name,
        email: email,
        password: password,
      );
      return Right(result);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
