import 'package:fluent_ui/fluent_ui.dart';

class AppTheme with ChangeNotifier {
  ThemeMode mode = ThemeMode.light;
  ThemeData lightTheme = ThemeData(
    visualDensity: VisualDensity.standard,
    focusTheme: FocusThemeData(
      glowFactor: is10footScreen() ? 2.0 : 0.0,
    ),
  );
  ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      visualDensity: VisualDensity.standard,
      focusTheme: FocusThemeData(
        glowFactor: is10footScreen() ? 2.0 : 0.0,
      ));
}
