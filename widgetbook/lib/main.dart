import 'package:flutter/widgets.dart';
import 'package:groceries_app/l10n/app_localizations.dart';
import 'package:groceries_app/ui/ui.dart';
import 'package:widgetbook/widgetbook.dart';

import 'components.g.dart';

void main() => runWidgetbook(config);

/// Wraps use-cases with the app's [AppTheme] so that `AppTheme.of(context)`
/// resolves. Shared between the interactive [ThemeAddon] and the [ThemeMode]s
/// used by the Cloud [ScenarioDefinition]s below.
Widget appThemeBuilder(
  BuildContext context,
  AppThemeData theme,
  Widget child,
) {
  return ColoredBox(
    color: theme.background.primary,
    child: DefaultTextStyle(
      style: theme.typography.bodyMedium,
      child: AppTheme(
        data: theme,
        child: child,
      ),
    ),
  );
}

final config = Config(
  components: components,
  // In v4 the [appBuilder] replaces the app scaffold (it must provide
  // Directionality/Overlay/MediaQuery), so the dark background is composed
  // inside the default [materialAppBuilder] rather than replacing it.
  appBuilder: (context, child) => materialAppBuilder(
    context,
    ColoredBox(
      color: const Color(0xFF404040),
      child: child,
    ),
  ),
  addons: [
    ViewportAddon([
      IosViewports.iPhone13,
      IosViewports.iPad,
    ]),
    LocaleAddon(
      // The first locale is the initial one; list English first to preserve
      // v3's default (which used `supportedLocales.last`, i.e. English).
      const [Locale('en'), Locale('de')],
      AppLocalizations.localizationsDelegates,
    ),
    ThemeAddon<AppThemeData>(
      {
        'Light': AppThemeData.light,
        'Dark': AppThemeData.dark,
      },
      appThemeBuilder,
    ),
    AlignmentAddon(),
    BuilderAddon(
      name: 'SafeArea',
      builder: (context, child) => SafeArea(
        child: child,
      ),
    ),
  ],
  scenarioConfig: ScenarioConfig(
    definitions: [
      _scenario(
        'German Light',
        const Locale('de'),
        AppThemeData.light,
        'Light',
      ),
      _scenario('German Dark', const Locale('de'), AppThemeData.dark, 'Dark'),
      _scenario(
        'English Light',
        const Locale('en'),
        AppThemeData.light,
        'Light',
      ),
      _scenario('English Dark', const Locale('en'), AppThemeData.dark, 'Dark'),
    ],
  ),
);

/// Builds a global [ScenarioDefinition] (one snapshot per story) that pins a
/// [Locale] and an [AppThemeData], replacing v3's `cloudAddonsConfigs`.
ScenarioDefinition _scenario(
  String name,
  Locale locale,
  AppThemeData theme,
  String themeName,
) {
  return ScenarioDefinition(
    name: name,
    strategy: ScenarioStrategy.perStory,
    modes: [
      LocaleMode(locale, AppLocalizations.localizationsDelegates),
      ThemeMode<AppThemeData>(themeName, theme, appThemeBuilder),
    ],
  );
}
