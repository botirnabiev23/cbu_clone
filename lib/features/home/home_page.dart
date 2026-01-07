import 'package:cbu/core/extensions/l10n_extension.dart';
import 'package:cbu/features/exchange/presentation/bloc/currency_bloc.dart';
import 'package:cbu/features/exchange/presentation/cubit/currency_search_cubit.dart';
import 'package:cbu/features/exchange/presentation/pages/currency_page.dart';
import 'package:cbu/features/other_pages/maps_page.dart';
import 'package:cbu/features/news/news_page.dart';
import 'package:cbu/features/settings/presentation/bloc/settings_bloc.dart';
import 'package:cbu/features/settings/presentation/pages/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageCB extends StatefulWidget {
  const HomePageCB({super.key});

  @override
  State<HomePageCB> createState() => _HomePageCBState();
}

class _HomePageCBState extends State<HomePageCB> {
  final TextEditingController _searchController = TextEditingController();

  List<Widget> body = const [
    CurrencyPage(),
    NewsPage(),
    MapsPage(),
    SettingPage(),
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<String> appBar = [
      context.l10n.currency,
      context.l10n.news,
      context.l10n.maps,
      context.l10n.settings,
    ];

    return BlocProvider(
      create: (context) => CurrencySearchCubit(),
      child: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, settingsState) {
          bool isDarkMode = settingsState.themeMode == ThemeMode.dark;
          return BlocListener<CurrencyBloc, CurrencyState>(
            listener: (context, currencyState) {
              if (currencyState.currencyList.isNotEmpty) {
                context
                    .read<CurrencySearchCubit>()
                    .setInitialList(currencyState.currencyList);
              }
            },
            child: BlocBuilder<CurrencySearchCubit, CurrencySearchState>(
              builder: (context, searchState) {
                final currentIndex = searchState.currentIndex;
                final isSearch = searchState.isSearching;

                return Scaffold(
                  bottomNavigationBar: BottomNavigationBar(
                    unselectedItemColor: Colors.grey.shade400,
                    showUnselectedLabels: true,
                    unselectedIconTheme:
                        IconThemeData(color: Colors.grey.shade400),
                    selectedIconTheme:
                        IconThemeData(color: Colors.yellow.shade700),
                    selectedItemColor: Colors.yellow.shade700,
                    type: BottomNavigationBarType.fixed,
                    onTap: (int newIndex) {
                      context.read<CurrencySearchCubit>().changeIndex(newIndex);
                      context.read<CurrencySearchCubit>().stopSearch();
                      _searchController.clear();
                    },
                    currentIndex: currentIndex,
                    items: <BottomNavigationBarItem>[
                      BottomNavigationBarItem(
                        icon: const Icon(Icons.arrow_upward),
                        label: context.l10n.currency,
                      ),
                      BottomNavigationBarItem(
                        icon: const Icon(Icons.newspaper),
                        label: context.l10n.news,
                      ),
                      BottomNavigationBarItem(
                        icon: const Icon(Icons.map),
                        label: context.l10n.maps,
                      ),
                      BottomNavigationBarItem(
                        icon: const Icon(Icons.settings),
                        label: context.l10n.settings,
                      ),
                    ],
                  ),
                  appBar: AppBar(
                    title: isSearch && currentIndex == 0
                        ? TextField(
                            controller: _searchController,
                            autofocus: true,
                            decoration: const InputDecoration(
                              hintText: 'Поиск...',
                              border: InputBorder.none,
                              hintStyle: TextStyle(color: Colors.white70),
                            ),
                            style: const TextStyle(color: Colors.white),
                            onChanged: (query) {
                              context
                                  .read<CurrencySearchCubit>()
                                  .queryChanged(query);
                            },
                          )
                        : Text(
                            appBar[currentIndex],
                            style: TextStyle(
                              color: isDarkMode ? Colors.black : Colors.white,
                            ),
                          ),
                    actions: [
                      if (currentIndex == 0)
                        IconButton(
                          onPressed: () {
                            if (isSearch) {
                              _searchController.clear();
                              context.read<CurrencySearchCubit>().stopSearch();
                            } else {
                              context.read<CurrencySearchCubit>().startSearch();
                            }
                          },
                          icon: Icon(
                            isSearch ? Icons.close : Icons.search,
                            color: isDarkMode ? Colors.black : Colors.white,
                          ),
                        ),
                    ],
                    automaticallyImplyLeading: false,
                    centerTitle: true,
                    backgroundColor: Colors.yellow.shade700,
                  ),
                  body: body[currentIndex],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
