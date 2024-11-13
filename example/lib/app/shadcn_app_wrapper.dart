import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

/// @no-doc
class ShadAppWrapper extends StatelessWidget {
  /// @no-doc
  const ShadAppWrapper({
    required this.home,
    required this.localizationsDelegates,
    required this.supportedLocales,
    super.key,
  });

  /// @no-doc
  final Widget home;

  /// @no-doc
  final Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates;

  /// @no-doc
  final Iterable<Locale> supportedLocales;

  @override
  Widget build(BuildContext context) {
    const colorSchemeName = 'blue';
    return ShadApp.material(
      localizationsDelegates: localizationsDelegates,
      supportedLocales: supportedLocales,
      debugShowCheckedModeBanner: false,
      darkTheme: ShadThemeData(
        brightness: Brightness.dark,
        colorScheme: ShadColorScheme.fromName(
          colorSchemeName,
          brightness: Brightness.dark,
        ),
      ),
      theme: ShadThemeData(
        brightness: Brightness.light,
        colorScheme: ShadColorScheme.fromName(
          colorSchemeName,
        ),
      ),
      home: home,
    );
  }
}
