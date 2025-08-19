import 'package:equatable/equatable.dart';
import 'package:flutter_clean/features/models/daily_news.dart';

class DailyNewsState extends Equatable implements ErrorState {
  final DailyNewsModel? dailyNewsModel;
  final String? error;
  final bool isLoading;

  const DailyNewsState({
    this.dailyNewsModel,
    this.error,
    this.isLoading = false,
  });

  DailyNewsState copyWith({
    DailyNewsModel? dailyNewsModel,
    String? error,
    bool? isLoading,
  }) {
    return DailyNewsState(
      error: error ?? this.error,
      dailyNewsModel: dailyNewsModel ?? dailyNewsModel,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [dailyNewsModel, error, isLoading];

  @override
  String? get errorMessage => error;
}

abstract class BaseState {
  const BaseState();
}

abstract class ErrorState extends BaseState {
  String? get errorMessage;
}
