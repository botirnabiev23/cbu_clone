import 'package:cbu/core/l10n/l10n.dart';
import 'package:cbu/features/exchange/presentation/bloc/currency_bloc.dart';
import 'package:cbu/core/l10n/app_localization.dart';
import 'package:cbu/core/locale/locale_theme.dart';
import 'package:cbu/features/splash/splash_screen.dart';
import 'package:cbu/core/providers/lang_provider.dart';
import 'package:cbu/core/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:cbu/core/di/injection.dart';

void main() async {
  await configureDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesHelper.init();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => LocaleProvider()),
        BlocProvider(
          create: (_) =>
              CurrencyBloc(sl())..add(CurrencyEvent.fetchRequested()),
        ),
      ],
      child: const CBUApp(),
    ),
  );
}

class CBUApp extends StatefulWidget {
  const CBUApp({super.key});

  @override
  State<CBUApp> createState() => _CBUAppState();
}

class _CBUAppState extends State<CBUApp> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final localeProvider = Provider.of<LocaleProvider>(context);

    return MaterialApp(
      themeMode: themeProvider.themeMode,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
      supportedLocales: L10n.all,
      locale: localeProvider.locale,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        AppLocalizations.delegate
      ],
    );
  }
}
