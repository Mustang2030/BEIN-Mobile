import 'package:bein_mobile/blocs/theme/theme_event.dart';
import 'package:bein_mobile/blocs/theme/theme_state.dart';
import 'package:bein_mobile/themes/app_themes.dart';
import 'package:bein_mobile/themes/theme_preferences.dart';
import 'package:bloc/bloc.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final ThemePreferences _preferences = ThemePreferences();

  ThemeBloc() : super(ThemeState(themeData: lightTheme, isDarkMode: false)) {
    _loadTheme();
    on<ToggleTheme>(_onToggleTheme);
  }

  void _onToggleTheme(ToggleTheme event, Emitter<ThemeState> emit) async {
    final newTheme = !state.isDarkMode;
    await _preferences.saveTheme(newTheme);
    emit(ThemeState(
        themeData: newTheme ? darkTheme : lightTheme, isDarkMode: newTheme));
  }

  void _loadTheme() async {
    final isDarkMode = await _preferences.getTheme();
    add(ToggleTheme());
  }
}
