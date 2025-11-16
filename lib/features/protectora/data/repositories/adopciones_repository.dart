import 'package:proyecto_protectora/features/protectora/data/models/adopcion_model.dart';
import 'package:uuid/uuid.dart';

class AdopcionesRepository {
  final _uuid = const Uuid();

  // Lista interna de adopciones (datos falsos por ahora)
  var _adopcionesList = <Adopcion>[
    Adopcion(
      idAnimal: 1,
      nombreAnimal: "Luna",
      chip: "CHIP12345",
      usuarioNombre: "Miriam García",
      usuarioEmail: "miriam@example.com",
      usuarioTelefono: "600123456",
      fechaAdopcion: DateTime(2025, 11, 10, 15, 30),
    ),
    Adopcion(
      idAnimal: 2,
      nombreAnimal: "Max",
      chip: "CHIP67890",
      usuarioNombre: "Carlos Pérez",
      usuarioEmail: "carlos@example.com",
      usuarioTelefono: "611987654",
      fechaAdopcion: DateTime(2025, 11, 11, 10, 15),
    ),
    Adopcion(
      idAnimal: 3,
      nombreAnimal: "Nala",
      chip: "CHIP54321",
      usuarioNombre: "Laura Sánchez",
      usuarioEmail: "laura@example.com",
      usuarioTelefono: "622456789",
      fechaAdopcion: DateTime(2025, 11, 12, 18, 45),
    ),
  ];

  /// Obtener todas las adopciones
  Future<List<Adopcion>> fetchAll() async {
    await Future<void>.delayed(const Duration(milliseconds: 250));
    return _adopcionesList;
  }

  /// Obtener una adopción por idAnimal
  Future<Adopcion?> fetchOne(int idAnimal) async {
    await Future<void>.delayed(const Duration(milliseconds: 250));
    return _adopcionesList.firstWhere(
      (adopcion) => adopcion.idAnimal == idAnimal,
      orElse: () => throw Exception("Adopción no encontrada"),
    );
  }

  /// Añadir una nueva adopción
  Future<Adopcion> addAdopcion({
    required int idAnimal,
    required String nombreAnimal,
    required String chip,
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
    _adopcionesList = [..._adopcionesList, nueva];
    return nueva;
  }

  /// Actualizar datos de una adopción
  Future<void> updateAdopcion(
    int idAnimal, {
    String? usuarioNombre,
    String? usuarioEmail,
    String? usuarioTelefono,
  }) async {
    _adopcionesList = _adopcionesList.map((adopcion) {
      if (adopcion.idAnimal == idAnimal) {
        return Adopcion(
          idAnimal: adopcion.idAnimal,
          nombreAnimal: adopcion.nombreAnimal,
          chip: adopcion.chip,
          usuarioNombre: usuarioNombre ?? adopcion.usuarioNombre,
          usuarioEmail: usuarioEmail ?? adopcion.usuarioEmail,
          usuarioTelefono: usuarioTelefono ?? adopcion.usuarioTelefono,
          fechaAdopcion: adopcion.fechaAdopcion,
        );
      }
      return adopcion;
    }).toList();
  }

  /// Eliminar una adopción
  Future<void> removeAdopcion(int idAnimal) async {
    _adopcionesList.removeWhere((a) => a.idAnimal == idAnimal);
  }
}
