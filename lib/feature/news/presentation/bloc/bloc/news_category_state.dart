part of 'news_category_bloc.dart';

sealed class NewsCategoryState extends Equatable {
  const NewsCategoryState();
  
  @override
  List<Object> get props => [];
}

final class NewsCategoryInitial extends NewsCategoryState {}
