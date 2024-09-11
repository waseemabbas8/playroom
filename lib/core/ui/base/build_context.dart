import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// Helpful extensions for [BuildContext]
extension ThemeProvider on BuildContext {

  ThemeData get theme => Theme.of(this);

  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  TextTheme get textTheme => Theme.of(this).textTheme;

  AppLocalizations get l10n => AppLocalizations.of(this)!;
}