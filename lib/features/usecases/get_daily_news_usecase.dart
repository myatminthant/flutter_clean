import 'package:flutter_clean/features/models/daily_news.dart';
import 'package:flutter_clean/features/repos/daily_news_api_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetDailyNewsUseCase extends UseCase<DailyNewsModel, DailyNewsRequest> {
  final DailyNewsApiRepo _repo;

  GetDailyNewsUseCase(this._repo);

  @override
  Future<DailyNewsModel> call(DailyNewsRequest params) async {
    return _repo.getDailyNewsApiRepo(
      params.country,
      params.category,
      params.apiKey,
    );
  }
}

abstract class UseCase<R, P> {
  Future<R> call(P params);
}

abstract class StreamUseCase<R, P> {
  Stream<R> call(P params);
}
