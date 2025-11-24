import 'package:proyecto_protectora/features/protectora/data/models/adopcion_model.dart';

class AdopcionesRepository {
  final List<Adopcion> _adopcionesList = [
    Adopcion(
      idAnimal: "1",
      nombreAnimal: "Luna",
      chip: "CHIP12345",
      usuarioNombre: "Miriam García",
      usuarioEmail: "miriam@example.com",
      usuarioTelefono: "600123456",
      fechaAdopcion: DateTime(2025, 11, 10, 15, 30),
    ),
    Adopcion(
      idAnimal: "2",
      nombreAnimal: "Max",
      chip: "CHIP67890",
      usuarioNombre: "Carlos Pérez",
      usuarioEmail: "carlos@example.com",
      usuarioTelefono: "611987654",
      fechaAdopcion: DateTime(2025, 11, 11, 10, 15),
    ),
    Adopcion(
      idAnimal: "3",
      nombreAnimal: "Nala",
      chip: "CHIP54321",
      usuarioNombre: "Laura Sánchez",
      usuarioEmail: "laura@example.com",
      usuarioTelefono: "622456789",
      fechaAdopcion: DateTime(2025, 11, 12, 18, 45),
    ),
  ];

  /// Devuelve todas las adopciones simulando una carga
  Future<List<Adopcion>> fetchAll() async {
    await Future<void>.delayed(const Duration(milliseconds: 250));
    return List<Adopcion>.from(_adopcionesList);
  }

  /// Devuelve una adopción concreta por su idAnimal
  Future<Adopcion?> fetchOne(String idAnimal) async {
    await Future<void>.delayed(const Duration(milliseconds: 250));
    return _adopcionesList.firstWhere(
      (adopcion) => adopcion.idAnimal == idAnimal,
      orElse: () => throw Exception("Adopción no encontrada"),
    );
  }

  /// Añade una nueva adopción a la lista
  Future<Adopcion> addAdopcion({
    required String idAnimal,
    required String nombreAnimal,
    required String? chip,
    required String usuarioNombre,
    required String usuarioEmail,
    required String usuarioTelefono,
  }) async {
    final nueva = Adopcion(
      idAnimal: idAnimal,
      nombreAnimal: nombreAnimal,
      chip: chip,
      usuarioNombre: usuarioNombre.trim(),
      usuarioEmail: usuarioEmail.trim(),
      usuarioTelefono: usuarioTelefono.trim(),
      fechaAdopcion: DateTime.now(),
    );
    // Se añade la nueva adopción
    _adopcionesList.add(nueva);
    return nueva;
  }

  /// Actualiza los datos de una adopción existente
  Future<void> updateAdopcion(
    String idAnimal, {
    String? usuarioNombre,
    String? usuarioEmail,
    String? usuarioTelefono,
  }) async {
    for (var i = 0; i < _adopcionesList.length; i++) {
      if (_adopcionesList[i].idAnimal == idAnimal) {
        _adopcionesList[i] = Adopcion(
          idAnimal: _adopcionesList[i].idAnimal,
          nombreAnimal: _adopcionesList[i].nombreAnimal,
          chip: _adopcionesList[i].chip,
          usuarioNombre: usuarioNombre ?? _adopcionesList[i].usuarioNombre,
          usuarioEmail: usuarioEmail ?? _adopcionesList[i].usuarioEmail,
          usuarioTelefono:
              usuarioTelefono ?? _adopcionesList[i].usuarioTelefono,
          fechaAdopcion: _adopcionesList[i].fechaAdopcion,
        );
        break;
      }
    }
  }

  /// Elimina una adopción de la lista por idAnimal
  Future<void> removeAdopcion(String idAnimal) async {
    _adopcionesList.removeWhere((a) => a.idAnimal == idAnimal);
  }
}
