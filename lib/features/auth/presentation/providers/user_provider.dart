import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_protectora/features/auth/data/models/user_model.dart';

class UserNotifier extends Notifier<User?> {
  @override
  User? build() {
    // Estado inicial: sin usuario
    return null;
  }

  /// Guardar usuario al hacer login
  void setUser(User user) {
    state = user;
  }

  /// Cerrar sesión
  void clearUser() {
    state = null;
  }
}

/// Provider global del usuario
final userProvider = NotifierProvider<UserNotifier, User?>(UserNotifier.new);
