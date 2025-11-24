import 'dart:convert';

import 'package:proyecto_protectora/core/utils/app_services.dart';
import 'package:proyecto_protectora/core/utils/constants.dart';
import 'package:proyecto_protectora/features/auth/data/models/user_model.dart';

// Repositorio encargado de la autenticación
class AuthRepository {
  // Método para iniciar sesión con usuario y contraseña
  Future<Map<String, dynamic>> login({
    required String username,
    required String password,
  }) async {
    // Petición POST al endpoint de login
    final response = await AppServices.dio.post(
      'https://dummyjson.com/auth/login',
      data: jsonEncode({
        'username': username,
        'password': password,
        'expiresInMins': 30,
      }),
    );

    // Conversión de la respuesta a mapa
    final data = response.data as Map<String, dynamic>;
    final token = data['accessToken'] as String?;
    final refreshToken = data['refreshToken'] as String?;

    // Si no se recibe token, se lanza excepción
    if (token == null) throw Exception('No se recibió token');

    // Almacenamiento del token en el sistema seguro
    await AppServices.storage.write(key: tokenKey, value: token);

    // Si existe refreshToken, también se almacena
    if (refreshToken != null) {
      await AppServices.storage.write(key: refreshKey, value: refreshToken);
    }

    // Se devuelve el mapa completo de datos
    return data;
  }

  // Método para obtener los datos del usuario logueado
  Future<User> getLoggedUserData() async {
    final response = await AppServices.dio.get('/auth/me');
    return User.fromMap(response.data as Map<String, dynamic>);
  }

  // Método para cerrar sesión eliminando tokens almacenados
  Future<void> logout() async {
    await AppServices.storage.delete(key: tokenKey);
    await AppServices.storage.delete(key: refreshKey);
  }

  // Método para leer el token almacenado
  Future<String?> readToken() => AppServices.storage.read(key: tokenKey);
}
