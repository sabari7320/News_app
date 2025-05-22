part of 'news_category_bloc.dart';

sealed class NewsCategoryState extends Equatable {
  const NewsCategoryState();

  @override
  List<Object> get props => [];
}

final class NewsCategoryInitial extends NewsCategoryState {}

final class NewsCategoryLoading extends NewsCategoryState {}

final class NewsCategorysuccess extends NewsCategoryState {
  final List<NewsEntity> categorynewslist;
  NewsCategorysuccess({required this.categorynewslist});
}

final class NewsCategoryError extends NewsCategoryState {}
