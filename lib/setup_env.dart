import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean/di/configure_dependencies.dart';
import 'package:flutter_clean/di/di_instance.dart';
import 'package:flutter_clean/features/blocs/daily_news_bloc.dart';
import 'package:flutter_clean/features/usecases/get_daily_news_usecase.dart';
import 'package:flutter_clean/main.dart';

Future<void> setupEnvironment() async {
  WidgetsFlutterBinding.ensureInitialized();

  const env = String.fromEnvironment('ENV');

  await envSetup(env);
  configureDependencies();

  //prevent app rotation
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runAppFunc();
}

envSetup(String env) async {
  final envFile = '.env';
  await dotenv.load(fileName: envFile);
}

void runAppFunc() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => DailyNewsBloc(getIt<GetDailyNewsUseCase>()),
        ),
      ],
      child: const FlutterCleanApp(),
    ),
  );
}
