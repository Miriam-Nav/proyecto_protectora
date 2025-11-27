import 'package:flutter/material.dart';

class FormControllers {
  // Controladores de texto
  final nombre = TextEditingController();
  final apellido1 = TextEditingController();
  final apellido2 = TextEditingController();
  final dni = TextEditingController();
  final telefono = TextEditingController();
  final email = TextEditingController();
  final direccion = TextEditingController();
  final cp = TextEditingController();
  final localidad = TextEditingController();
  final provincia = TextEditingController();

  // FocusNodes para cada campo
  final nombreFocus = FocusNode();
  final apellido1Focus = FocusNode();
  final apellido2Focus = FocusNode();
  final dniFocus = FocusNode();
  final telefonoFocus = FocusNode();
  final emailFocus = FocusNode();
  final direccionFocus = FocusNode();
  final cpFocus = FocusNode();
  final localidadFocus = FocusNode();
  final provinciaFocus = FocusNode();

  void dispose() {
    // Controladores
    nombre.dispose();
    apellido1.dispose();
    apellido2.dispose();
    dni.dispose();
    telefono.dispose();
    email.dispose();
    direccion.dispose();
    cp.dispose();
    localidad.dispose();
    provincia.dispose();

    // FocusNodes
    nombreFocus.dispose();
    apellido1Focus.dispose();
    apellido2Focus.dispose();
    dniFocus.dispose();
    telefonoFocus.dispose();
    emailFocus.dispose();
    direccionFocus.dispose();
    cpFocus.dispose();
    localidadFocus.dispose();
    provinciaFocus.dispose();
  }
}
