// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cbu/core/di/injection_module.dart' as _i508;
import 'package:cbu/features/exchange/data/data_source/remote_data_source/remote_data_source.dart'
    as _i513;
import 'package:cbu/features/exchange/data/repositories/currency_repository_impl.dart'
    as _i1037;
import 'package:cbu/features/exchange/domain/repositories/currency_repository.dart'
    as _i381;
import 'package:cbu/features/exchange/domain/use_cases/use_case.dart' as _i522;
import 'package:cbu/features/exchange/presentation/bloc/currency_bloc.dart'
    as _i884;
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final injectionModule = _$InjectionModule();
    gh.lazySingleton<_i361.Dio>(() => injectionModule.dio);
    gh.lazySingleton<_i513.RemoteDataSource>(
        () => _i513.CurrencyRemoteDataSourceImpl(gh<_i361.Dio>()));
    gh.lazySingleton<_i381.CurrencyRepository>(
        () => _i1037.CurrencyRepositoryImpl(gh<_i513.RemoteDataSource>()));
    gh.lazySingleton<_i522.GetCurrency>(
        () => _i522.GetCurrency(gh<_i381.CurrencyRepository>()));
    gh.factory<_i884.CurrencyBloc>(
        () => _i884.CurrencyBloc(gh<_i522.GetCurrency>()));
    return this;
  }
}

class _$InjectionModule extends _i508.InjectionModule {}
