import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_protectora/features/auth/data/models/usuario_model.dart';

class UsuarioNotifier extends Notifier<Usuario?> {
  @override
  Usuario? build() {
    // Estado inicial: sin usuario
    return null;
  }

  /// Guardar usuario al hacer login
  void setUser(Usuario user) {
    state = user;
  }

  /// Cerrar sesión
  void clearUser() {
    state = null;
  }
}

/// Provider global del usuario
final usuarioProvider = NotifierProvider<UsuarioNotifier, Usuario?>(UsuarioNotifier.new);
