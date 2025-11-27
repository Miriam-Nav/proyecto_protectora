import 'package:flutter/material.dart';

class AnimalFormControllers {
  // FocusNodes para cada campo
  final nombreFocus = FocusNode();
  final razaFocus = FocusNode();
  final chipFocus = FocusNode();
  final fotoFocus = FocusNode();
  final descripcionFocus = FocusNode();
  final fechaFocus = FocusNode();
  final sexoFocus = FocusNode();
  final tipoFocus = FocusNode();

  // FocusNodes
  void dispose() {
    nombreFocus.dispose();
    razaFocus.dispose();
    chipFocus.dispose();
    fotoFocus.dispose();
    descripcionFocus.dispose();
    fechaFocus.dispose();
    sexoFocus.dispose();
    tipoFocus.dispose();
  }
}
