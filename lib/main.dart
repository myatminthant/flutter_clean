import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean/di/configure_dependencies.dart';
import 'package:flutter_clean/di/di_instance.dart';
import 'package:flutter_clean/features/blocs/daily_news_bloc.dart';
import 'package:flutter_clean/features/pages/daily_news_page.dart';
import 'package:flutter_clean/features/usecases/get_daily_news_usecase.dart';
import 'package:flutter_clean/setup_env.dart';

void main() {
  setupEnvironment();
}

class FlutterCleanApp extends StatelessWidget {
  const FlutterCleanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DailyNewsPage(),
    );
  }
}
