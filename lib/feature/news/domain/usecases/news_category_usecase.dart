import 'package:news_app/core/errors/failure.dart';
import 'package:news_app/core/usecases/usecase.dart';
import 'package:news_app/feature/news/domain/entities/news_Category_entity.dart';
import 'package:news_app/feature/news/domain/repositories/news_category_repo.dart';
import 'package:fpdart/fpdart.dart';

class NewsCategoryUsecase extends NoParams {
  final NewsCategoryRepo newsCategoryRepo;

  NewsCategoryUsecase({required this.newsCategoryRepo});

  Future<Either<Failure, List<NewsEntity>>> call() {
    return newsCategoryRepo.newsCategoryList();
  }
}
