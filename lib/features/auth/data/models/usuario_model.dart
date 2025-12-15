class Usuario {
  final int idUser;
  final String nombre;
  final String contrasenya;
  final String direccion;
  final String email;
  final String telefono;
  final String dni;
  final String rol;

  Usuario({
    required this.idUser,
    required this.nombre,
    required this.contrasenya,
    required this.direccion,
    required this.email,
    required this.telefono,
    required this.dni,
    required this.rol,
  });

  factory Usuario.fromMap(Map<String, dynamic> map) {
    return Usuario(
      idUser: map['id_user'] as int,
      nombre: map['nombre'] as String,
      contrasenya: map['contrasenya'] as String,
      direccion: map['direccion'] as String,
      email: map['email'] as String,
      telefono: map['telefono'].toString(), // si viene como int
      dni: map['DNI'] as String,
      rol: map['rol'] as String,
    );
  }
}
