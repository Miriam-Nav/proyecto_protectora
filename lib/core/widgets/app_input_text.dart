import 'package:flutter/material.dart';
import 'package:proyecto_protectora/app/theme/app_palette.dart';

class AppInputText extends StatelessWidget {
  final IconData? leadingIcon;
  final String label;
  final dynamic seleccion;
  TextEditingController get nombreController =>
      TextEditingController(text: seleccion);

  const AppInputText({
    super.key,
    this.leadingIcon,
    required this.label,
    this.seleccion,
  });

  @override
  Widget build(BuildContext context) {
    appPaletteOf(context);

    return TextField(
      controller: nombreController,
      textAlign: TextAlign.start,
      style: const TextStyle(
        color: Color.fromARGB(238, 238, 124, 43),
        fontSize: 13,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w400,
      ),

      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          fontSize: 15,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            width: 1,
            color: Color.fromARGB(238, 238, 124, 43),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            width: 1,
            color: Color.fromARGB(238, 238, 124, 43),
          ),
        ),
      ),
    );
  }
}
