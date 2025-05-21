import 'package:fpdart/fpdart.dart';
import 'package:news_app/core/errors/failure.dart';
import 'package:news_app/feature/auth/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserEntity>> signup({
    required String name,
    required String email,
    required String password,
  });

  Future<Either<Failure, UserEntity>> signin({
    required String email,
    required String password,
  });
}
