import 'package:cbu/core/di/injection.dart';
import 'package:cbu/core/l10n/app_localization.dart';
import 'package:cbu/core/l10n/l10n.dart';
import 'package:cbu/features/exchange/presentation/bloc/currency_bloc.dart';
import 'package:cbu/features/settings/presentation/bloc/settings_bloc.dart';
import 'package:cbu/features/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const CBUApp());
}

class CBUApp extends StatelessWidget {
  const CBUApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) =>
              sl<SettingsBloc>()..add(const SettingsEvent.appStarted()),
        ),
        BlocProvider(
          create: (_) =>
              sl<CurrencyBloc>()..add(const CurrencyEvent.fetchRequested()),
        ),
      ],
      child: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, state) {
          return MaterialApp(
            themeMode: state.themeMode,
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            home: const SplashScreen(),
            debugShowCheckedModeBanner: false,
            supportedLocales: L10n.all,
            locale: state.locale,
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              AppLocalizations.delegate,
            ],
          );
        },
      ),
    );
  }
}
