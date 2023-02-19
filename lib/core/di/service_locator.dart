import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:townsquare/core/di/service_locator.config.dart';

final locator = GetIt.instance;

@InjectableInit()
void setupLocator() => $initGetIt(locator);