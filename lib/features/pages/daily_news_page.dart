import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean/env.dart';
import 'package:flutter_clean/features/blocs/daily_news_bloc.dart';
import 'package:flutter_clean/features/blocs/daily_news_event.dart';
import 'package:flutter_clean/features/blocs/daily_news_state.dart';
import 'package:flutter_clean/features/models/daily_news.dart';

class DailyNewsPage extends StatefulWidget {
  const DailyNewsPage({super.key});

  @override
  State<DailyNewsPage> createState() => _DailyNewsPageState();
}

class _DailyNewsPageState extends State<DailyNewsPage> {
  late DailyNewsBloc _dailyNewsBloc;

  @override
  void initState() {
    _dailyNewsBloc = BlocProvider.of<DailyNewsBloc>(context);
    _dailyNewsBloc.add(
      GetDailyNewsEvent(
        dailyNewsRequest: DailyNewsRequest(
          country: 'us',
          category: 'business',
          apiKey: Env.apiKey,
        ),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Daily News')),
      body: BlocBuilder<DailyNewsBloc, DailyNewsState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.error != null) {
            return Center(child: Text('Error: ${state.error}'));
          } else if (state.dailyNewsModel != null) {
            return ListView.builder(
              itemCount: state.dailyNewsModel!.articles.length,
              itemBuilder: (context, index) {
                final article = state.dailyNewsModel!.articles[index];
                return Column(
                  children: [
                    ListTile(
                      titleAlignment: ListTileTitleAlignment.top,
                      leading: Container(
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                            image: NetworkImage(article.urlToImage),
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                      title: Text(
                        article.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        article.description,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Divider(height: 16, color: Colors.grey[200]),
                  ],
                );
              },
            );
          } else {
            return const Center(child: Text('No news available'));
          }
        },
      ),
    );
  }
}
