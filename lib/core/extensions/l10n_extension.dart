import 'package:flutter/widgets.dart';
import 'package:cbu/core/l10n/app_localization.dart';

extension L10nX on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this)!;
}
