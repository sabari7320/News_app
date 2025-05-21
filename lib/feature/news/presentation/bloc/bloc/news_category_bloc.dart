import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'news_category_event.dart';
part 'news_category_state.dart';

class NewsCategoryBloc extends Bloc<NewsCategoryEvent, NewsCategoryState> {
  NewsCategoryBloc() : super(NewsCategoryInitial()) {
    on<NewsCategoryEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
