import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';


// Listado de colores inmutables
final colorListProvider = Provider((ref) => colorList);

// Provider para el tema de la aplicación
final isDarkModeProvider = StateProvider<bool>((ref) => false);

// Provider seleccionado de color
final selectedColorProvider = StateProvider<int>((ref) => 0);