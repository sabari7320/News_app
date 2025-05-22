import 'package:get_it/get_it.dart';
import 'package:news_app/feature/auth/data/datasoruces/auth_remote_datasources.dart';
import 'package:news_app/feature/auth/data/repositories/auth_repository_impl.dart';
import 'package:news_app/feature/auth/domain/repositories/auth_repository.dart';
import 'package:news_app/feature/auth/domain/usecases/signIn_usecase.dart';
import 'package:news_app/feature/auth/domain/usecases/signup_usecase.dart';
import 'package:news_app/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:news_app/feature/news/data/datasources/news_category_remotedatasources.dart';
import 'package:news_app/feature/news/data/repositories/news_category_repo_impl.dart';
import 'package:news_app/feature/news/domain/repositories/news_category_repo.dart';
import 'package:news_app/feature/news/domain/usecases/news_category_usecase.dart';
import 'package:news_app/feature/news/presentation/bloc/bloc/news_category_bloc.dart';

final sl = GetIt.instance;

Future<void> configureDependencies() async {
  //Data sources

  sl.registerLazySingleton<AuthRemoteDatasources>(
    () => AuthRemoteDatasourcesImpl(),
  );

  //Repository from data layer

  sl.registerLazySingleton<AuthRepository>(
    () =>
        AuthRepositoryImpl(authRemoteDatasources: sl<AuthRemoteDatasources>()),
  );

  //Use cases

  sl.registerLazySingleton(
    () => SignUpUsecase(authRepository: sl<AuthRepository>()),
  );

  sl.registerLazySingleton(
    () => SigninUsecase(authRepository: sl<AuthRepository>()),
  );

  //Bloc

  sl.registerLazySingleton(
    () => AuthBLoc(
      signUpUsecase: sl<SignUpUsecase>(),
      signinUsecase: sl<SigninUsecase>(),
    ),
  );

  //news screen resources

  //Data Resources
  sl.registerLazySingleton<NewscategoryRemoteDataSources>(
    () => NewsCategoryRemotedatasourcesImpl(),
  );

  //Repositories from data layer
  sl.registerLazySingleton<NewsCategoryRepo>(
    () => NewsCategoryRepoImpl(
      remotedatasource: sl<NewscategoryRemoteDataSources>(),
    ),
  );

  //usecases
  sl.registerLazySingleton(
    () => NewsCategoryUsecase(newsCategoryRepo: sl<NewsCategoryRepo>()),
  );

  //news Category bloc
  sl.registerLazySingleton(
    () => NewsCategoryBloc(newsCategoryUsecase: sl<NewsCategoryUsecase>()),
  );
}
