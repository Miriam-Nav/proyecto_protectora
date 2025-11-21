import 'package:flutter/material.dart';
import 'package:proyecto_protectora/app/theme/app_palette.dart';

class AppInputText extends StatelessWidget {
  final IconData? leadingIcon;
  final String label;
  final dynamic seleccion;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool readOnly;
  final bool obscureText;
  final Color? color;

  const AppInputText({
    super.key,
    this.leadingIcon,
    required this.label,
    this.seleccion,
    this.controller,
    this.validator,
    this.readOnly = false,
    this.obscureText = false,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final colorSelect = color ?? appPaletteOf(context).primary;

    return TextFormField(
      controller: controller ?? TextEditingController(text: seleccion),
      validator: validator,
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
          borderSide: BorderSide(width: 1, color: colorSelect),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(width: 1, color: colorSelect),
        ),
      ),
    );
  }
}

class AppInputSelect<T> extends StatelessWidget {
  final String label;
  final T? value;
  final List<T> items;
  final String Function(T) itemLabel;
  final void Function(T?) onChanged;
  final String? Function(T?)? validator;
  final Color? color;

  const AppInputSelect({
    super.key,
    required this.label,
    required this.value,
    required this.items,
    required this.itemLabel,
    required this.onChanged,
    this.validator,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final colorSelect = color ?? appPaletteOf(context).primary;

    return DropdownButtonFormField<T>(
      value: value,
      items: items.map((item) {
        return DropdownMenuItem<T>(value: item, child: Text(itemLabel(item)));
      }).toList(),
      onChanged: onChanged,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
          color: appPaletteOf(context).secondary,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: colorSelect, width: 1.5),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: colorSelect, width: 2),
        ),
      ),
    );
  }
}
