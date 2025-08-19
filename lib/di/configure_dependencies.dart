import 'package:flutter_clean/di/configure_dependencies.config.dart';
import 'package:flutter_clean/di/di_instance.dart';
import 'package:injectable/injectable.dart';

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
void configureDependencies() => getIt.init();
