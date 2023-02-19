// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:stacked_services/stacked_services.dart' as _i5;

import '../network/api_service.dart' as _i3;
import '../repositories/auth/auth_repository.dart' as _i4;
import '../repositories/home/home_repository.dart' as _i6;
import '../services/third_party_services_module.dart' as _i8;
import '../utils/local_stotage.dart'
    as _i7; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final thirdPartyServicesModule = _$ThirdPartyServicesModule();
  gh.lazySingleton<_i3.ApiService>(() => thirdPartyServicesModule.apiService);
  gh.lazySingleton<_i4.AuthRepository>(
      () => thirdPartyServicesModule.authRepository);
  gh.lazySingleton<_i5.DialogService>(
      () => thirdPartyServicesModule.dialogService);
  gh.lazySingleton<_i6.HomeRepository>(
      () => thirdPartyServicesModule.homeRepository);
  gh.lazySingleton<_i7.LocalStorage>(
      () => thirdPartyServicesModule.localStorage);
  gh.lazySingleton<_i5.NavigationService>(
      () => thirdPartyServicesModule.navigationService);
  gh.lazySingleton<_i5.SnackbarService>(
      () => thirdPartyServicesModule.snackBarService);
  return get;
}

class _$ThirdPartyServicesModule extends _i8.ThirdPartyServicesModule {
  @override
  _i3.ApiService get apiService => _i3.ApiService();
  @override
  _i4.AuthRepository get authRepository => _i4.AuthRepository();
  @override
  _i5.DialogService get dialogService => _i5.DialogService();
  @override
  _i6.HomeRepository get homeRepository => _i6.HomeRepository();
  @override
  _i7.LocalStorage get localStorage => _i7.LocalStorage();
  @override
  _i5.NavigationService get navigationService => _i5.NavigationService();
  @override
  _i5.SnackbarService get snackBarService => _i5.SnackbarService();
}
