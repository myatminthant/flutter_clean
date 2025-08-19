import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean/features/blocs/daily_news_event.dart';
import 'package:flutter_clean/features/blocs/daily_news_state.dart';
import 'package:flutter_clean/features/usecases/get_daily_news_usecase.dart';
import 'package:injectable/injectable.dart';

@injectable
class DailyNewsBloc extends Bloc<DailyNewsEvent, DailyNewsState> {
  final GetDailyNewsUseCase _getDailyNewsUseCase;
  DailyNewsBloc(this._getDailyNewsUseCase) : super(DailyNewsState()) {
    on<GetDailyNewsEvent>(_onGetDailyNewsEvent);
  }

  void _onGetDailyNewsEvent(GetDailyNewsEvent event, Emitter emit) async {
    emit(state.copyWith(isLoading: true));
    try {
      final response = await _getDailyNewsUseCase.call(event.dailyNewsRequest);
      emit(state.copyWith(isLoading: false, dailyNewsModel: response));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: 'Error'));
    }
  }
}
