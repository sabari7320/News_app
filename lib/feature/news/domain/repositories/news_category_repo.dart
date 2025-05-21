import 'package:news_app/core/errors/failure.dart';
import 'package:news_app/feature/news/domain/entities/news_Category_entity.dart';
import 'package:fpdart/fpdart.dart';

abstract class NewsCategoryRepo {
  Future<Either<Failure, List<NewsEntity>>> newsCategoryList();
}
