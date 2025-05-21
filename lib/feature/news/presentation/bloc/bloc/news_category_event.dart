part of 'news_category_bloc.dart';

sealed class NewsCategoryEvent extends Equatable {
  const NewsCategoryEvent();

  @override
  List<Object> get props => [];
}

final class categoryListEvent extends NewsCategoryEvent {
  final String? category;
  categoryListEvent({required this.category});
}
