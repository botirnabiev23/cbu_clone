import 'package:flutter/widgets.dart';
import 'package:cbu/core/l10n/app_localization.dart';

extension Localizations on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this)!;
}
