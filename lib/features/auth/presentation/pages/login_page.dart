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
  final _formKey = GlobalKey<FormState>();

  // valores por defecto
  final _userCtrl = TextEditingController(text: 'emilys');
  final _passCtrl = TextEditingController(text: 'emilyspass');

  bool _loading = false;

  @override
  void dispose() {
    _userCtrl.dispose();
    _passCtrl.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    final l10n = AppLocalizations.of(context)!;
    if (!_formKey.currentState!.validate()) return;
    setState(() => _loading = true);
    try {
      await ref
          .read(authControllerProvider.notifier)
          .signIn(username: _userCtrl.text.trim(), password: _passCtrl.text);

      final usuario = ref.read(authControllerProvider).value;
      if (usuario != null && mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MenuButtons(user: usuario)),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('${l10n.errorSesion} ${e.toString()}')),
        );
      }
    } finally {
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
                    // Logo arriba
                    Image.asset(
                      "assets/images/gato_conn_perro_login.png",
                      width: 100,
                      height: 100,
                    ),
                    const SizedBox(height: 16),

                    // Título
                    Text(
                      ' ${l10n.bienvenida} ${l10n.appTitle}',
                      style: Theme.of(
                        context,
                      ).textTheme.titleMedium?.copyWith(),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      l10n.usuarioContrasenya,
                      style: Theme.of(context).textTheme.bodySmall,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),

                    // Usuario
                    AppInputText(label: l10n.usuario, controller: _userCtrl),
                    const SizedBox(height: 20),

                    // Contraseña
                    AppInputText(
                      label: l10n.contrasenya,
                      controller: _passCtrl,
                      obscureText: true,
                    ),
                    const SizedBox(height: 25),

                    // Botón
                    AppButton(
                      label: l10n.iniciarSesion,
                      onPressed: _loading ? null : _submit,
                      foregroundColorOverride: palette.background,
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
