import 'package:fpdart/src/either.dart';
import 'package:news_app/core/errors/failure.dart';
import 'package:news_app/core/usecases/usecase.dart';
import 'package:news_app/feature/auth/domain/entities/user_entity.dart';
import 'package:news_app/feature/auth/domain/repositories/auth_repository.dart';

class SigninUsecase implements UsecasewithParams<UserEntity, SigninParams> {
  final AuthRepository authRepository;
  SigninUsecase({required this.authRepository});

  @override
  Future<Either<Failure, UserEntity>> call(SigninParams params) async {
    return await authRepository.signin(
      email: params.email,
      password: params.password,
    );
  }
}

class SigninParams {
  final String email;
  final String password;

  SigninParams({required this.email, required this.password});
}
