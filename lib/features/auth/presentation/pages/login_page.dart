import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_protectora/app/theme/app_palette.dart';
import 'package:proyecto_protectora/core/l10n/app_localizations.dart';
import 'package:proyecto_protectora/core/widgets/app_button.dart';
import 'package:proyecto_protectora/core/widgets/app_input_text.dart';
import 'package:proyecto_protectora/features/auth/controllers/auth_controller.dart';
import 'package:proyecto_protectora/features/protectora/presentation/widgets/menu_buttons.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  // Clave global para validar el formulario
  final _formKey = GlobalKey<FormState>();

  // Controladores de texto con valores por defecto
  final _userCtrl = TextEditingController(text: 'emilys');
  final _passCtrl = TextEditingController(text: 'emilyspass');

  // Indicador de carga
  bool _loading = false;

  @override
  void dispose() {
    // Liberación de recursos de los controladores
    _userCtrl.dispose();
    _passCtrl.dispose();
    super.dispose();
  }

  // Método para enviar el formulario de login
  Future<void> _submit() async {
    final l10n = AppLocalizations.of(context)!;
    // Validación del formulario
    if (!_formKey.currentState!.validate()) return;
    setState(() => _loading = true);
    try {
      // Llamada al controlador de autenticación para iniciar sesión
      await ref
          .read(authControllerProvider.notifier)
          .signIn(username: _userCtrl.text.trim(), password: _passCtrl.text);

      // Obtiene el usuario autenticado
      final usuario = ref.read(authControllerProvider).value;
      // Si existe usuario, se navega a la pantalla principal
      if (usuario != null && mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MenuButtons(user: usuario)),
        );
      }
    } catch (e) {
      // En caso de error, se muestra un mensaje en un SnackBar
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('${l10n.errorSesion} ${e.toString()}')),
        );
      }
    } finally {
      // Se desactiva el estado de carga
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final palette = appPaletteOf(context);

    return Scaffold(
      body: Center(
        child: Card(
          color: palette.menuButton,
          elevation: 12,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(color: palette.primary, width: 2),
          ),
          child: Container(
            padding: const EdgeInsets.all(32.0),
            constraints: const BoxConstraints(maxWidth: 380),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Logo adaptado al tema claro/oscuro
                    Image.asset(
                      Theme.of(context).brightness == Brightness.dark
                          ? "assets/images/logoDark.png"
                          : "assets/images/logoLight.png",
                      width: 100,
                      height: 100,
                    ),

                    const SizedBox(height: 16),

                    // Título de bienvenida
                    Text(
                      ' ${l10n.bienvenida} ${l10n.appTitle}',
                      style: Theme.of(
                        context,
                      ).textTheme.titleMedium?.copyWith(),
                    ),
                    const SizedBox(height: 8),

                    // Texto explicativo
                    Text(
                      l10n.usuarioContrasenya,
                      style: Theme.of(context).textTheme.bodySmall,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),

                    // Campo de usuario
                    AppInputText(label: l10n.usuario, controller: _userCtrl),
                    const SizedBox(height: 20),

                    // Campo de contraseña
                    AppInputText(
                      label: l10n.contrasenya,
                      controller: _passCtrl,
                      obscureText: true,
                    ),
                    const SizedBox(height: 25),

                    // Botón de inicio de sesión
                    AppButton(
                      label: l10n.iniciarSesion,
                      onPressed: _loading ? null : _submit,
                      txColor: palette.background,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
