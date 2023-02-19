import 'package:injectable/injectable.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:townsquare/core/network/api_service.dart';
import 'package:townsquare/core/repositories/auth/auth_repository.dart';
import 'package:townsquare/core/repositories/home/home_repository.dart';
import 'package:townsquare/core/utils/local_stotage.dart';

@module
abstract class ThirdPartyServicesModule {
  @lazySingleton
  NavigationService get navigationService;

  @lazySingleton
  DialogService get dialogService;

  @lazySingleton
  SnackbarService get snackBarService;

  @lazySingleton
  ApiService get apiService;

  @lazySingleton
  LocalStorage get localStorage;

  @lazySingleton
  HomeRepository get homeRepository;

  @lazySingleton
  AuthRepository get authRepository;
}
