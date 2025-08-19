import 'package:flutter_clean/features/models/daily_news.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'daily_news_api_repo.g.dart';

@injectable
@RestApi()
abstract class DailyNewsApiRepo {
  @factoryMethod
  factory DailyNewsApiRepo(Dio dio) => _DailyNewsApiRepo(dio);

  @GET('/top-headlines')
  Future<DailyNewsModel> getDailyNewsApiRepo(
    @Query('country') String country,
    @Query('category') String category,
    @Query('apiKey') String apiKey,
  );
}
