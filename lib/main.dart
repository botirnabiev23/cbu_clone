import 'package:cbu/core/l10n/l10n.dart';
import 'package:cbu/features/exchange/presentation/bloc/currency_bloc.dart';
import 'package:cbu/core/l10n/app_localization.dart';
import 'package:cbu/features/splash/splash_screen.dart';
import 'package:cbu/features/settings/bloc/settings_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:cbu/core/di/injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => SettingsBloc()..add(const SettingsEvent.appStarted()),
        ),
        BlocProvider(
          create: (_) =>
              CurrencyBloc(sl())..add(const CurrencyEvent.fetchRequested()),
        ),
      ],
      child: const CBUApp(),
    ),
  );
}

class CBUApp extends StatelessWidget {
  const CBUApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
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
            AppLocalizations.delegate
          ],
        );
      },
    );
  }
}
