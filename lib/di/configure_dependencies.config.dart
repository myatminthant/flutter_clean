// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../features/blocs/daily_news_bloc.dart' as _i341;
import '../features/repos/daily_news_api_repo.dart' as _i946;
import '../features/usecases/get_daily_news_usecase.dart' as _i457;
import '../services/service_dio.dart' as _i2;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final serviceDio = _$ServiceDio();
    gh.lazySingleton<_i361.Dio>(() => serviceDio.dio());
    gh.factory<_i946.DailyNewsApiRepo>(
      () => _i946.DailyNewsApiRepo(gh<_i361.Dio>()),
    );
    gh.factory<_i457.GetDailyNewsUseCase>(
      () => _i457.GetDailyNewsUseCase(gh<_i946.DailyNewsApiRepo>()),
    );
    gh.factory<_i341.DailyNewsBloc>(
      () => _i341.DailyNewsBloc(gh<_i457.GetDailyNewsUseCase>()),
    );
    return this;
  }
}

class _$ServiceDio extends _i2.ServiceDio {}
