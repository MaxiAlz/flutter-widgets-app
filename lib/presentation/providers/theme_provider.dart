import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

// Estado booleano simple
final isDarkModeProvider = StateProvider((ref) => false);

//Listado de colores inmutables
final colorListProvider = Provider((ref) => colorList);

//manejo de entero
final selectedColorProvider = StateProvider((ref) => 0);