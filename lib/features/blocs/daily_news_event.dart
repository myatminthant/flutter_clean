import 'package:flutter_clean/features/models/daily_news.dart';

abstract class DailyNewsEvent {
  const DailyNewsEvent();
}

class GetDailyNewsEvent extends DailyNewsEvent {
  final DailyNewsRequest dailyNewsRequest;
  const GetDailyNewsEvent({required this.dailyNewsRequest});
}
