// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cbu/core/di/injection_module.dart' as _i508;
import 'package:cbu/features/exchange/data/data_source/currency_local_data_source.dart'
    as _i186;
import 'package:cbu/features/exchange/data/data_source/currency_remote_data_source.dart'
    as _i692;
import 'package:cbu/features/exchange/data/repositories/currency_repository_impl.dart'
    as _i1037;
import 'package:cbu/features/exchange/domain/repositories/currency_repository.dart'
    as _i381;
import 'package:cbu/features/exchange/domain/use_cases/add_to_favourites_use_case.dart'
    as _i691;
import 'package:cbu/features/exchange/domain/use_cases/get_currency_use_case.dart'
    as _i836;
import 'package:cbu/features/exchange/domain/use_cases/get_favourites_use_case.dart'
    as _i426;
import 'package:cbu/features/exchange/presentation/bloc/currency_bloc.dart'
    as _i884;
import 'package:cbu/features/exchange/presentation/cubit/currency_search_cubit.dart'
    as _i242;
import 'package:cbu/features/favourites/bloc/favourites_bloc.dart' as _i83;
import 'package:cbu/features/settings/data/data_sources/settings_local_data_source.dart'
    as _i235;
import 'package:cbu/features/settings/data/repositories/settings_repository_impl.dart'
    as _i756;
import 'package:cbu/features/settings/domain/repositories/settings_repository.dart'
    as _i151;
import 'package:cbu/features/settings/domain/use_cases/get_locale_use_case.dart'
    as _i845;
import 'package:cbu/features/settings/domain/use_cases/get_theme_mode_use_case.dart'
    as _i195;
import 'package:cbu/features/settings/domain/use_cases/set_locale_use_case.dart'
    as _i421;
import 'package:cbu/features/settings/domain/use_cases/set_theme_mode_use_case.dart'
    as _i114;
import 'package:cbu/features/settings/presentation/bloc/settings_bloc.dart'
    as _i622;
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final injectionModule = _$InjectionModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => injectionModule.prefs,
      preResolve: true,
    );
    gh.factory<_i242.CurrencySearchCubit>(() => _i242.CurrencySearchCubit());
    gh.lazySingleton<_i361.Dio>(() => injectionModule.dio);
    gh.lazySingleton<_i692.CurrencyRemoteDataSource>(
        () => _i692.CurrencyRemoteDataSourceImpl(gh<_i361.Dio>()));
    gh.lazySingleton<_i186.CurrencyLocalDataSource>(
        () => _i186.CurrencyLocalDataSourceImpl(gh<_i460.SharedPreferences>()));
    gh.lazySingleton<_i235.SettingsLocalDataSource>(
        () => _i235.SettingsLocalDataSourceImpl(gh<_i460.SharedPreferences>()));
    gh.lazySingleton<_i151.SettingsRepository>(() =>
        _i756.SettingsRepositoryImpl(gh<_i235.SettingsLocalDataSource>()));
    gh.lazySingleton<_i845.GetLocaleUseCase>(
        () => _i845.GetLocaleUseCase(gh<_i151.SettingsRepository>()));
    gh.lazySingleton<_i195.GetThemeModeUseCase>(
        () => _i195.GetThemeModeUseCase(gh<_i151.SettingsRepository>()));
    gh.lazySingleton<_i421.SetLocaleUseCase>(
        () => _i421.SetLocaleUseCase(gh<_i151.SettingsRepository>()));
    gh.lazySingleton<_i114.SetThemeModeUseCase>(
        () => _i114.SetThemeModeUseCase(gh<_i151.SettingsRepository>()));
    gh.lazySingleton<_i381.CurrencyRepository>(
        () => _i1037.CurrencyRepositoryImpl(
              gh<_i692.CurrencyRemoteDataSource>(),
              gh<_i186.CurrencyLocalDataSource>(),
            ));
    gh.factory<_i622.SettingsBloc>(() => _i622.SettingsBloc(
          setThemeModeUseCase: gh<_i114.SetThemeModeUseCase>(),
          getLocaleUseCase: gh<_i845.GetLocaleUseCase>(),
          setLocaleUseCase: gh<_i421.SetLocaleUseCase>(),
          getThemeModeUseCase: gh<_i195.GetThemeModeUseCase>(),
        ));
    gh.lazySingleton<_i691.AddToFavouritesUseCase>(
        () => _i691.AddToFavouritesUseCase(gh<_i381.CurrencyRepository>()));
    gh.lazySingleton<_i836.GetCurrencyUseCase>(
        () => _i836.GetCurrencyUseCase(gh<_i381.CurrencyRepository>()));
    gh.lazySingleton<_i426.GetFavouritesUseCase>(
        () => _i426.GetFavouritesUseCase(gh<_i381.CurrencyRepository>()));
    gh.factory<_i83.FavouritesBloc>(() => _i83.FavouritesBloc(
          gh<_i426.GetFavouritesUseCase>(),
          gh<_i691.AddToFavouritesUseCase>(),
        ));
    gh.factory<_i884.CurrencyBloc>(
        () => _i884.CurrencyBloc(gh<_i836.GetCurrencyUseCase>()));
    return this;
  }
}

class _$InjectionModule extends _i508.InjectionModule {}
