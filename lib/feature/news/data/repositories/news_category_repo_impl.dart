import 'package:fpdart/src/either.dart';
import 'package:news_app/core/errors/failure.dart';
import 'package:news_app/feature/news/data/datasources/news_category_remotedatasources.dart';
import 'package:news_app/feature/news/domain/entities/news_Category_entity.dart';
import 'package:news_app/feature/news/domain/repositories/news_category_repo.dart';

class NewsCategoryRepoImpl extends NewsCategoryRepo {
  final NewscategoryRemoteDataSources remotedatasource;

  NewsCategoryRepoImpl({required this.remotedatasource});

  @override
  Future<Either<Failure, List<NewsEntity>>> newsCategoryList({
    String? category,
  }) async {
    try {
      final categoryModel = await remotedatasource.NewsCategoryList(
        category: category ?? '',
      );
      print("repository Impl successs");
      return Right(categoryModel as List<NewsEntity>);
    } catch (e) {
      print("repository impl errrorrrr");
      // Failure: Wrap the error in Left
      return Left(Failure(e.toString()));
    }
  }
}
