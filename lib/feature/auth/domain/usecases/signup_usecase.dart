import 'package:news_app/core/errors/failure.dart';
import 'package:news_app/core/usecases/usecase.dart';
import 'package:news_app/feature/auth/domain/entities/user_entity.dart';
import 'package:news_app/feature/auth/domain/repositories/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class SignUpUsecase implements UsecasewithParams<UserEntity, SignUpParams> {
  final AuthRepository authRepository;

  SignUpUsecase({required this.authRepository});

  @override
  Future<Either<Failure, UserEntity>> call(SignUpParams params) async {
    return await authRepository.signup(
      name: params.name,
      email: params.email,
      password: params.password,
    );
  }
}

class SignUpParams {
  final String name;
  final String email;
  final String password;

  SignUpParams({
    required this.name,
    required this.email,
    required this.password,
  });
}
