import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_protectora/features/auth/data/models/usuario_model.dart';
import 'package:proyecto_protectora/features/auth/data/repositories/auth_repository.dart';

// Controlador de autenticación que maneja el estado del usuario logueado
class AuthController extends AsyncNotifier<Usuario?> {
  // Repositorio de autenticación
  final AuthRepository _repo = AuthRepository();

  @override
  Future<Usuario?> build() async {
    try {
      // Intenta leer el token guardado
      final token = await _repo.readToken();
      if (token == null) {
        return null;
      } // Si no hay token, no hay usuario logueado

      // Si hay token, pide los datos del usuario logueado
      final user = await _repo.getLoggedUserData();
      return user;
    } catch (_) {
      // Si algo falla, cierra sesión y devuelve null
      await _repo.logout();
      return null;
    }
  }

  // Método para iniciar sesión
  Future<void> signIn({required String email, required String pass}) async {
    // Estado inicial: cargando

    state = const AsyncLoading();
    try {
      // Intenta loguear con usuario y contraseña
      await _repo.login(email: email, password: pass);

      // Si funciona, obtiene los datos del usuario y actualiza el estado
      final user = await _repo.getLoggedUserData();
      state = AsyncData(user);
    } catch (e, st) {
      // Si falla, guarda el error en el estado
      state = AsyncError(e, st);
      // Y luego lo deja en null para indicar que no hay usuario
      state = const AsyncData(null);
      rethrow; // Relanza el error para que pueda ser capturado fuera
    }
  }

  // Método para cerrar sesión
  Future<void> signOut() async {
    await _repo.logout();
    state = const AsyncData(null); // Estado vuelve a null (sin usuario)
  }

  // Método para recargar el perfil del usuario
  Future<Usuario> reloadProfile() async {
    final user = await _repo.getLoggedUserData();
    state = AsyncData(user); // Actualiza el estado con el nuevo perfil
    return user;
  }
}

// Provider que expone el AuthController a toda la app
final authControllerProvider = AsyncNotifierProvider<AuthController, Usuario?>(
  () {
    return AuthController();
  },
);
