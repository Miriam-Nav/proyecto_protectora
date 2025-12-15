import 'dart:ui';

class Preferences {
  final bool modoOscuro;
  final Locale idioma;

  const Preferences({required this.modoOscuro, required this.idioma});

  // Método para crear una copia modificada de las preferencias
  Preferences copyWith({bool? modoOscuro, Locale? idioma}) => Preferences(
    // Si se pasa un nuevo valor de modoOscuro se usa, en caso contrario, se mantiene el actual
    modoOscuro: modoOscuro ?? this.modoOscuro,
    // Si se pasa un nuevo idioma se usa,en caso contrario, se mantiene el actual
    idioma: idioma ?? this.idioma,
  );
}
