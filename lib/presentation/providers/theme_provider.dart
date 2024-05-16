import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

// 1) Provider -> Es para valores inmutables
// 2) StateProvider -> Es para mantener una pieza de estado mutable
// 3) StateNotifierProvider -> Es para mantener una pieza de estado mutable y
//                             notificar a los consumidores cuando cambia.

// Listado de colores inmutables
final colorListProvider = Provider((ref) => colorList);

// Provider para el tema de la aplicación
final isDarkModeProvider = StateProvider<bool>((ref) => false);

// Provider seleccionado de color
final selectedColorProvider = StateProvider<int>((ref) => 0);

// Un objeto de tipo AppTheme (custom)
// StateNotifierProvider<Controlador, Estado>
final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
  (ref) => ThemeNotifier()
);


// Controller o Notifier para el tema de la aplicación
class ThemeNotifier extends StateNotifier<AppTheme> {
  // Este estado va a usar en este caso el AppTheme

  // STATE = Estado = new AppTheme() -> Como valor inicial
  ThemeNotifier():super(AppTheme());

  void toggleDarkMode(){
    state = state.copyWith(isDarkMode: !state.isDarkMode); // El nuevo estado es igual al estado actual pero con el isDarkMode invertido
  }

  void changeColor(int colorIndex){
    state = state.copyWith(selectedColor: colorIndex); // El nuevo estado es igual al estado actual pero con el color seleccionado
  }

}