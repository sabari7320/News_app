import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app/feature/news/domain/entities/news_Category_entity.dart';
import 'package:news_app/feature/news/domain/usecases/news_category_usecase.dart';

part 'news_category_event.dart';
part 'news_category_state.dart';

class NewsCategoryBloc extends Bloc<NewsCategoryEvent, NewsCategoryState> {
  final NewsCategoryUsecase newsCategoryUsecase;

  NewsCategoryBloc({required this.newsCategoryUsecase})
    : super(NewsCategoryInitial()) {
    on<categoryListEvent>(_onCategory);
  }

  Future<void> _onCategory(
    categoryListEvent event,
    Emitter<NewsCategoryState> emit,
  ) async {
    emit(NewsCategoryLoading());
    final res = await newsCategoryUsecase.call(
      CategoryParams(category: event.category),
    );

    //     res.fold(
    //       (failure) => emit(NewsCategoryError()),
    //       ((categoryList){
    //  emit(NewsCategorysuccess(categorynewslist: categoryList)))
    //       }

    //     );

    res.fold(
      (failure) {
        print("❌ Failed to fetch news: $failure");
        emit(NewsCategoryError());
      },
      (categoryList) {
        print("✅ News fetched successfully: ${categoryList.length} items");
        emit(NewsCategorysuccess(categorynewslist: categoryList));
      },
    );
  }
}
