import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:proyecto_protectora/core/utils/app_services.dart';
import 'package:proyecto_protectora/core/utils/constants.dart';
import 'package:proyecto_protectora/features/auth/data/models/usuario_model.dart';

// Repositorio encargado de la autenticación
class AuthRepository {
  // Método para iniciar sesión con usuario y contraseña
  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    // Petición POST al endpoint de login
    final response = await AppServices.dio.post(
      '/auth/login',
      data: jsonEncode({'email': email, 'password': password}),
    );

    // Conversión de la respuesta a mapa
    final data = response.data as Map<String, dynamic>;
    final token = data['access_token'] as String?;

    // Si no se recibe token, se lanza excepción
    if (token == null) throw Exception('No se recibió token');

    // Almacenamiento del token en el sistema seguro
    await AppServices.storage.write(key: tokenKey, value: token);
    return data;
  }

  // Método para obtener los datos del usuario logueado
  Future<Usuario> getLoggedUserData() async {
    final token = await readToken();
    if (token == null) throw Exception('No hay token almacenado');
    final response = await AppServices.dio.get(
      '/auth/profile',
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );

    return Usuario.fromMap(response.data as Map<String, dynamic>);
  }

  // Método para cerrar sesión eliminando tokens almacenados
  Future<void> logout() async {
    await AppServices.storage.delete(key: tokenKey);
  }

  // Método para leer el token almacenado
  Future<String?> readToken() => AppServices.storage.read(key: tokenKey);
}
