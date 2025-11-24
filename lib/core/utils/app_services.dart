// app_services.dart
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'constants.dart';

// Dio: librería que se usa para hacer peticiones a una API (GET, POST, etc.).
// Clase que centraliza servicios comunes de la app.
// Configuración del almacenamiento seguro y el cliente HTTP (Dio).
class AppServices {
  // Se usa para guardar datos sensibles como el token de sesión.
  static final FlutterSecureStorage storage = const FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
    iOptions: IOSOptions(accessibility: KeychainAccessibility.first_unlock),
  );

  // Cliente HTTP principal de la aplicación.
  // Se construye con la configuración definida en _buildDio().
  static final Dio dio = _buildDio();

  // Método privado que crea y configura el cliente Dio.
  static Dio _buildDio() {
    final d = Dio(
      BaseOptions(
        // URL base de la API
        baseUrl: baseUrl,

        // Tiempo máximo de conexión y recepción
        connectTimeout: const Duration(seconds: 20),
        receiveTimeout: const Duration(seconds: 20),

        // Cabeceras comunes para todas las peticiones
        headers: const {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        validateStatus: (s) => s != null && s < 500,
      ),
    );

    // Interceptor: filtro que se ejecuta antes de cada petición
    // Interceptor que añade el token de autorización si existe.
    d.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          // Se lee el token desde el almacenamiento seguro.
          final token = await storage.read(key: tokenKey);

          // Si hay token, se añade a la cabecera Authorization.
          if (token != null && token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
          }

          // Continúa con la petición.
          handler.next(options);
        },
      ),
    );
    // Se devuelve el cliente configurado.
    return d;
  }
}
