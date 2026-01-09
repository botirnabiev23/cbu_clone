import 'package:cbu/core/extensions/l10n_extension.dart';

import 'package:cbu/features/settings/presentation/bloc/settings_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String _getLanguageName(String languageCode) {
    switch (languageCode) {
      case 'uz':
        return 'O\'zbekcha';
      case 'ru':
        return 'Русский';
      case 'en':
        return 'English';
      default:
        return 'Русский';
    }
  }

  void openRadioList(BuildContext context, String currentSelected) {
    showModalBottomSheet(
      context: context,
      builder: (modalContext) {
        return RadioGroup<String>(
          groupValue: currentSelected,
          onChanged: (String? value) {
            if (value == null) {
              return;
            }
            late Locale locale;
            switch (value) {
              case 'O\'zbekcha':
                locale = const Locale('uz');
              case 'Русский':
                locale = const Locale('ru');
              case 'English':
                locale = const Locale('en');
              default:
                locale = const Locale('ru');
            }
            context
                .read<SettingsBloc>()
                .add(SettingsEvent.localeChanged(locale));
            context.pop(modalContext);
          },
          child: const Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              RadioListTile<String>(
                title: Text('O\'zbekcha'),
                value: 'O\'zbekcha',
              ),
              RadioListTile<String>(
                title: Text('Русский'),
                value: 'Русский',
              ),
              RadioListTile<String>(
                title: Text('English'),
                value: 'English',
              ),
              SizedBox(height: 15),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        bool isDarkMode = state.themeMode == ThemeMode.dark;
        String selectedOption =
            _getLanguageName(state.locale?.languageCode ?? 'ru');

        return ListView(
          children: [
            Column(
              children: [
                ListTile(
                  title: Text(
                    context.l10n.system_settings,
                  ),
                  titleTextStyle:
                      Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                ),
                ListTile(
                  title: Text(context.l10n.language),
                  subtitle: Text(selectedOption),
                  onTap: () => openRadioList(context, selectedOption),
                  leading: const Icon(Icons.language),
                ),
                ListTile(
                  title: Text(context.l10n.theme),
                  subtitle: Text(
                    isDarkMode
                        ? context.l10n.dark_theme
                        : context.l10n.light_theme,
                  ),
                  leading: isDarkMode
                      ? const Icon(Icons.brightness_2_outlined)
                      : const Icon(Icons.brightness_4_outlined),
                  trailing: Switch(
                    activeThumbColor: Colors.green,
                    value: isDarkMode,
                    onChanged: (value) {
                      context.read<SettingsBloc>().add(
                            SettingsEvent.themeChanged(
                              value ? ThemeMode.dark : ThemeMode.light,
                            ),
                          );
                    },
                  ),
                ),
                ListTile(
                  title: Text(context.l10n.other),
                  titleTextStyle:
                      Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                ),
                ListTile(
                  title: Text(context.l10n.support),
                  onTap: () {},
                  leading: const Icon(Icons.mail),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
