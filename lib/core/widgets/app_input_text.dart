import 'package:flutter/material.dart';
import 'package:proyecto_protectora/app/theme/app_palette.dart';

class AppInputText extends StatelessWidget {
  final IconData? leadingIcon;
  final String label;
  final dynamic seleccion;
  final TextEditingController? controller;
  final bool readOnly;
  final bool obscureText;

  const AppInputText({
    super.key,
    this.leadingIcon,
    required this.label,
    this.seleccion,
    this.controller,
    this.readOnly = false,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    appPaletteOf(context);

    return TextFormField(
      controller: controller ?? TextEditingController(text: seleccion),
      readOnly: readOnly,
      obscureText: obscureText,
      textAlign: TextAlign.start,
      style: Theme.of(
        context,
      ).textTheme.labelLarge?.copyWith(color: appPaletteOf(context).secondary),

      decoration: InputDecoration(
        labelText: label,
        labelStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
          color: appPaletteOf(context).secondary,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            width: 1,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            width: 1,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
    );
  }
}
