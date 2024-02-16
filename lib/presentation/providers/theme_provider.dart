import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

// Estado booleano simple
final isDarkModeProvider = StateProvider((ref) => false);

//Listado de colores inmutables
final colorListProvider = Provider((ref) => colorList);

//manejo de entero
final selectedColorProvider = StateProvider((ref) => 0);

// Objeto de tipo AppTheme (custom)
final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
  (ref) => ThemeNotifier(),
);

// controlador del theme
class ThemeNotifier extends StateNotifier<AppTheme> {
  //creando instancia de apptheme
  // STATE = Estado = new Theme();
  ThemeNotifier() : super(AppTheme());

  void toggleDarkMode() {
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

  void changeColorProvider(int colorIndex) {
    state = state.copyWith(selectedColor: colorIndex);
  }
}
