import 'package:flutter/material.dart';
import 'package:flutter_clean/features/pages/daily_news_page.dart';
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
