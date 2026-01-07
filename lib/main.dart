import 'package:cbu/core/di/injection.dart';
import 'package:cbu/core/l10n/app_localization.dart';
import 'package:cbu/core/l10n/l10n.dart';
import 'package:cbu/features/settings/presentation/bloc/settings_bloc.dart';
import 'package:cbu/router/app_router.dart';
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
    return BlocProvider(
      create: (_) => sl<SettingsBloc>()..add(const SettingsEvent.appStarted()),
      child: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, state) {
          return MaterialApp.router(
            routerConfig: router,
            themeMode: state.themeMode,
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
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
