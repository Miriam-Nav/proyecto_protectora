import 'package:flutter/material.dart';
import 'package:proyecto_protectora/app/theme/app_palette.dart';

// Campo de texto personalizado para formularios
class AppInputText extends StatelessWidget {
  // Icono opcional al inicio
  final IconData? leadingIcon;
  // Etiqueta del campo
  final String label;
  // Valor inicial
  final dynamic seleccion;
  // Controlador opcional para manejar el texto
  final TextEditingController? controller;
  // Función de validación opcional
  final String? Function(String?)? validator;
  // Si el campo es solo lectura
  final bool readOnly;
  // Si el texto debe ocultarse
  final bool obscureText;
  // Color opcional para el borde
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
    // Color seleccionado
    final colorSelect = color ?? appPaletteOf(context).primary;

    // Campo de texto con estilos y validación
    return TextFormField(
      // Controlador del texto.
      controller: controller ?? TextEditingController(text: seleccion),

      // Función de validación opcional
      validator: validator,

      // Si es true, el campo no se puede editar
      readOnly: readOnly,

      // Si es true, oculta el texto
      obscureText: obscureText,

      // Alineación del texto dentro del campo
      textAlign: TextAlign.start,

      // Estilo del texto
      style: Theme.of(
        context,
      ).textTheme.labelLarge?.copyWith(color: appPaletteOf(context).secondary),

      // Decoración del campo
      decoration: InputDecoration(
        labelText: label,

        // Estilo de la etiqueta
        labelStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
          color: appPaletteOf(context).secondary,
        ),

        // Borde cuando el campo está habilitado pero no enfocado
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(width: 1, color: colorSelect),
        ),

        // Borde cuando el campo está enfocado
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(width: 1, color: colorSelect),
        ),
      ),
    );
  }
}

// Campo de selección desplegable personalizado
class AppInputSelect<T> extends StatelessWidget {
  // Etiqueta del campo
  final String label;
  // Valor actual seleccionado
  final T? value;
  // Lista de opciones
  final List<T> items;
  // Función para mostrar el texto de cada opción
  final String Function(T) itemLabel;
  // Acción al cambiar la selección
  final void Function(T?) onChanged;
  // Función de validación opcional
  final String? Function(T?)? validator;
  // Color opcional para el borde
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
    // Color seleccionado, por defecto el primario de la paleta
    final colorSelect = color ?? appPaletteOf(context).primary;

    // Campo de formulario con menú desplegable
    // Menú desplegable con estilo y validación
    return DropdownButtonFormField<T>(
      initialValue: value,
      items: items.map((item) {
        // Representa una opción dentro del menú
        return DropdownMenuItem<T>(value: item, child: Text(itemLabel(item)));
      }).toList(),
      onChanged: onChanged,
      validator: validator,
      // Decoración del campo
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
