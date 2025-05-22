import 'package:news_app/core/errors/failure.dart';
import 'package:news_app/core/usecases/usecase.dart';
import 'package:news_app/feature/news/domain/entities/news_Category_entity.dart';
import 'package:news_app/feature/news/domain/repositories/news_category_repo.dart';
import 'package:fpdart/fpdart.dart';

class NewsCategoryUsecase
    extends UsecasewithParams<List<NewsEntity>, CategoryParams> {
  final NewsCategoryRepo newsCategoryRepo;

  NewsCategoryUsecase({required this.newsCategoryRepo});
  @override
  Future<Either<Failure, List<NewsEntity>>> call(CategoryParams params) async {
    return await newsCategoryRepo.newsCategoryList(category: params.category);
  }
}

class CategoryParams {
  String? category;

  CategoryParams({required this.category});
}
