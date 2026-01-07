import 'package:cbu/core/di/injection.dart';
import 'package:cbu/features/exchange/presentation/bloc/currency_bloc.dart';
import 'package:cbu/features/exchange/presentation/cubit/currency_search_cubit.dart';
import 'package:cbu/features/exchange/presentation/pages/currency_page.dart';
import 'package:cbu/features/favourites/bloc/favourites_bloc.dart';
import 'package:cbu/features/favourites/pages/favourites_page.dart';
import 'package:cbu/features/home/home_page.dart';
import 'package:cbu/features/news/news_page.dart';
import 'package:cbu/features/settings/presentation/pages/settings_page.dart';
import 'package:cbu/features/splash/splash_screen.dart';
import 'package:cbu/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: AppRoutes.splash.path,
  routes: [
    GoRoute(
      name: AppRoutes.splash.name,
      path: AppRoutes.splash.path,
      builder: (context, state) => const SplashScreen(),
    ),
    StatefulShellRoute.indexedStack(
      builder: (_, __, navigatorShell) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (_) =>
                  sl<CurrencyBloc>()..add(const CurrencyEvent.fetchRequested()),
            ),
            BlocProvider(
              create: (_) => CurrencySearchCubit(),
            ),
            BlocProvider(
              create: (_) =>
                  sl<FavouritesBloc>()..add(const FavouritesEvent.load()),
            ),
          ],
          child: HomePageCB(navigationShell: navigatorShell),
        );
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              name: AppRoutes.currency.name,
              path: AppRoutes.currency.path,
              builder: (context, state) => const CurrencyPage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              name: AppRoutes.news.name,
              path: AppRoutes.news.path,
              builder: (context, state) => const NewsPage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              name: AppRoutes.favourites.name,
              path: AppRoutes.favourites.path,
              builder: (context, state) => const FavouritesPage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              name: AppRoutes.settings.name,
              path: AppRoutes.settings.path,
              builder: (context, state) => const SettingsPage(),
            ),
          ],
        ),
      ],
    ),
  ],
);
