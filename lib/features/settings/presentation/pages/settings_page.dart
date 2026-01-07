import 'package:cbu/core/extensions/l10n_extension.dart';
import 'package:cbu/features/settings/presentation/bloc/settings_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
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
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            RadioListTile<String>(
              title: const Text('O\'zbekcha'),
              value: 'O\'zbekcha',
              groupValue: currentSelected,
              onChanged: (String? value) {
                context
                    .read<SettingsBloc>()
                    .add(const SettingsEvent.localeChanged(Locale('uz')));
                Navigator.pop(modalContext);
              },
            ),
            RadioListTile<String>(
              title: const Text('Русский'),
              value: 'Русский',
              groupValue: currentSelected,
              onChanged: (String? value) {
                context
                    .read<SettingsBloc>()
                    .add(const SettingsEvent.localeChanged(Locale('ru')));
                Navigator.pop(modalContext);
              },
            ),
            RadioListTile<String>(
              title: const Text('English'),
              value: 'English',
              groupValue: currentSelected,
              onChanged: (String? value) {
                context
                    .read<SettingsBloc>()
                    .add(const SettingsEvent.localeChanged(Locale('en')));
                Navigator.pop(modalContext);
              },
            ),
            const SizedBox(height: 15),
          ],
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
