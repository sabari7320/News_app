import 'package:fpdart/fpdart.dart';
import 'package:news_app/core/errors/failure.dart';

abstract class UsecasewithParams<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams {}
