import 'dart:ui';

class Preferences {
  final bool darkmode;
  final Locale language;

  const Preferences({required this.darkmode, required this.language});

  // Método para crear una copia modificada de las preferencias
  Preferences copyWith({bool? darkmode, Locale? language}) => Preferences(
    // Si se pasa un nuevo valor de darkmode se usa, en caso contrario, se mantiene el actual
    darkmode: darkmode ?? this.darkmode,
    // Si se pasa un nuevo idioma se usa,en caso contrario, se mantiene el actual
    language: language ?? this.language,
  );
}
