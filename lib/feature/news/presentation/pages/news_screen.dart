import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/cubits/auth_cubits.dart';
import 'package:news_app/core/cubits/theme_cubit.dart';
import 'package:news_app/core/utils/string_utils.dart';
import 'package:news_app/feature/news/presentation/bloc/bloc/news_category_bloc.dart';
import 'package:news_app/feature/news/presentation/widgets/news_list.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    setlogin();
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

  Future<void> setlogin() async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.setBool('userlogin', true);
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
          actions: [
            PopupMenuButton(
              onSelected: (value) async {
                if (value == 'theme') {
                  context.read<ThemesCubit>().clickTheme();
                } else if (value == 'logout') {
                  final shouldLogout = await showDialog<bool>(
                    context: context,
                    builder:
                        (context) => AlertDialog(
                          title: const Text("Confirm Logout"),
                          content: const Text(
                            "Are you sure you want to logout?",
                          ),
                          actions: [
                            TextButton(
                              onPressed:
                                  () => Navigator.of(
                                    context,
                                  ).pop(false), // cancel
                              child: const Text("Cancel"),
                            ),
                            TextButton(
                              onPressed:
                                  () => Navigator.of(
                                    context,
                                  ).pop(true), // confirm
                              child: const Text("Logout"),
                            ),
                          ],
                        ),
                  );

                  if (shouldLogout == true) {
                    print("caling lod]gouttt");
                    context.read<AuthCubit>().logout();
                  }
                }
                print("POp up menu item value is ${value}");
              },
              itemBuilder: (context) {
                final isdark = Theme.of(context).brightness == Brightness.dark;
                return [
                  PopupMenuItem(
                    value: "theme",
                    child: ListTile(
                      leading: Icon(
                        isdark ? Icons.wb_sunny : Icons.nightlight_round,
                      ),
                      title: Text(isdark ? "Light Theme" : "Dark Theme"),
                    ),
                  ),

                  PopupMenuItem(
                    value: "logout",
                    child: ListTile(
                      leading: Icon(Icons.logout),

                      title: Text("Logout"),
                    ),
                  ),
                ];
              },
            ),
          ],
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
