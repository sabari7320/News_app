import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/utils/string_utils.dart';
import 'package:news_app/feature/news/presentation/bloc/bloc/news_category_bloc.dart';
import 'package:news_app/feature/news/presentation/widgets/news_list.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen>
    with SingleTickerProviderStateMixin {
  List<String> news_titles = [
    "business",
    "entertainment",
    "general",
    "health",
    "science",
    "sports",
    "technology",
  ];
  late TabController _tabController;

  int _lastFetchedIndex = 0;

  @override
  void initState() {
    super.initState();

    // Initial fetch
    context.read<NewsCategoryBloc>().add(
      categoryListEvent(category: news_titles[0]),
    );

    _tabController = TabController(length: news_titles.length, vsync: this);

    // Detect swipe halfway or complete
    _tabController.animation?.addListener(() {
      final animationValue = _tabController.animation!.value;
      final currentIndex = animationValue.round();

      if (currentIndex != _lastFetchedIndex &&
          currentIndex >= 0 &&
          currentIndex < news_titles.length) {
        _lastFetchedIndex = currentIndex;
        context.read<NewsCategoryBloc>().add(
          categoryListEvent(category: news_titles[currentIndex]),
        );
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: news_titles.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text("News Times"),
          bottom: TabBar(
            controller: _tabController,
            isScrollable: true,
            tabs: List.generate(
              news_titles.length,
              (index) => Tab(text: news_titles[index].captialize()),
            ),
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children:
              news_titles.map((category) {
                return BlocConsumer<NewsCategoryBloc, NewsCategoryState>(
                  listenWhen:
                      (previous, current) => current is NewsCategoryError,
                  listener: (context, state) {
                    if (state is NewsCategoryError) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Failed to load $category news'),
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state is NewsCategoryLoading) {
                      return Center(child: CircularProgressIndicator());
                    } else if (state is NewsCategorysuccess) {
                      // Ensure you're filtering based on selected category
                      return NewsList(newslist: state.categorynewslist);
                      // return Center(
                      //   child: Text(state.categorynewslist[0].title),
                      // );
                    } else {
                      return Center(child: Text("No $category News available"));
                    }
                  },
                );
              }).toList(),
        ),
      ),
    );
  }
}
