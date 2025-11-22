import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_it.dart';

abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es'),
    Locale('it'),
  ];
  // --- Textos generales ---
  // Título principal de la aplicación, aparece en la barra superior y en metadatos.
  String get appTitle;
  // Saludo dinámico que incluye el nombre del usuario.
  String hello(String name);
  // Texto introductorio para mostrar información de un animal ("Conoce a ...").
  String get conocer;
  // Etiqueta para la página de inicio.
  String get inicio;
  // Texto que se muestra cuando el usuario accede como invitado.
  String get invitado;
  // Texto que se muestra cuando no hay correo disponible.
  String get sinCorreo;
  // Mensaje que indica que no hay sesión iniciada.
  String get noLoggin;
  // Texto genérico de confirmación tras guardar cambios.
  String get guardado;
  // Etiqueta para seleccionar idioma en las preferencias.
  String get idioma;
  // Texto del botón o menú para cambiar idioma.
  String get selecIdioma;
  // Título de la sección de apariencia en preferencias.
  String get apariencia;
  // Texto para activar/desactivar el modo oscuro.
  String get modoOsc;
  // Título de la sección de gestión de páginas.
  String get namePagesGestion;
  // Texto para la página de catálogo.
  String get pagCatalogo;
  // Valores genéricos de confirmación: Sí / No.
  String get si;
  String get no;

  // --- Textos de drawerPage ---
  // Opción de menú para abrir preferencias.
  String get preferencias;
  // Opción de menú para abrir catálogo.
  String get catalogo;
  // Opción de menú para cerrar sesión.
  String get cerrarSesion;

  // --- Textos de Datos Usuario ---
  // Título de la página de datos de usuario.
  String get datosUsuario;
  // Campo de formulario para el nombre de usuario.
  String get usuario;
  // Campo de formulario para la fecha de nacimiento.
  String get fechaNacimiento;
  // Campo de formulario para el nombre del adoptante.
  String get nombreAdoptante;
  // Campo de formulario para el primer apellido.
  String get apellido1;
  // Campo de formulario para el segundo apellido.
  String get apellido2;
  // Campo de formulario para el DNI.
  String get dni;
  // Campo de formulario para el teléfono.
  String get telefono;
  // Campo de formulario para el correo electrónico.
  String get correo;
  // Campo de formulario para la dirección.
  String get direccion;
  // Campo de formulario para el código postal.
  String get cp;
  // Campo de formulario para la localidad.
  String get localidad;
  // Campo de formulario para la provincia.
  String get provincia;

  // --- Textos de Datos Animales ---
  // Campo de formulario para el nombre del animal.
  String get nombre;
  // Campo de formulario para el chip identificador.
  String get chipAnimal;
  // Campo de formulario para el sexo del animal.
  String get sexoAnimal;
  // Opciones de sexo: macho / hembra.
  String get macho;
  String get hembra;
  // Campo de formulario para la raza del animal.
  String get razaAnimal;
  // Campo de formulario para el tipo de animal.
  String get tipoAnimal;
  // Opciones de tipo: perro / gato / otro.
  String get perro;
  String get gato;
  String get otro;
  // Campo de formulario para indicar si está esterilizado.
  String get esterelizadoAnimal;
  // Campo de formulario para la foto del animal.
  String get fotoAnimal;
  // Campo de formulario para la descripción breve del animal.
  String get descripcionAnimal;

  // --- Textos Botones ---
  // Botón para gestionar animales.
  String get botonAciones;
  // Botón para enviar solicitud de adopción.
  String get enviarSolicitud;
  // Botón para adoptar un animal.
  String get adoptar;
  // Botón para abrir perfil de usuario.
  String get buttonProfile;

  // --- Textos de HomePage ---
  // Texto de Total de Adopciones.
  String get totalAdop;
  // Texto de Adopciones a Revisar.
  String get revisarAdop;
  // Tarjeta de notificación de visita veterinaria.
  String get visitaVeterinario;
  // Título de la sección de acciones.
  String get acciones;
  // Título de la sección de actividad reciente.
  String get actividadReciente;
  // Mensaje cuando no hay actividad registrada.
  String get sinActividadReciente;
  // Texto que acompaña a una solicitud de adopción.
  String get solicitudAdopcion;
  // Texto genérico para adopción.
  String get adopcion;

  // --- Textos de Formulario Adopción ---
  // Aviso de que la solicitud se guardó correctamente.
  String get avisoSolicitudGuardada;
  String get solicitudCreada;
  String get preguntEliAdop;
  String get solicitudEliminada;
  String get noAnimalSelect;

  // Título principal del formulario de adopción.
  String get tituloFormulario;
  // Mensaje de chip duplicado.
  String get chipDuplicado;
  // Mensaje cuando no se encuentra el animal.
  String get animalNoEncontrado;
  // Validaciones de campos obligatorios y formatos.
  String get nombreObligatorio;
  String get obligatorioApellido1;
  String get obligatorioApellido2;
  String get obligatorioDni;
  String get formatoDni;
  String get obligatorioTelefono;
  String get formatoNum;
  String get obligatorioCorreo;
  String get formatoCorreo;
  String get obligatorioDireccion;
  String get obligatorioCp;
  String get obligLocalidad;
  String get obligProvincia;

  // --- Textos de CRUDAnimalPage ---
  // Título de la página de gestión de animales.
  String get gestionarAnimales;
  // Mensaje cuando no hay animales registrados.
  String get noAnimalesRegistrados;
  // Texto para seleccionar un animal a editar.
  String get selecEdicion;
  // Validaciones de campos obligatorios.
  String get selecSexo;
  String get razaOblig;
  String get tipoOblig;
  String get fechaOblig;
  String get fotoOblig;
  String get descOblig;
  String get descLong;
  // Botones de acción en CRUD.
  String get crearAnimal;
  String get guardarCambios;

  // --- Textos de ClientePage ---
  // Título de sección noticias y eventos.
  String get noticiasEventos;
  // Mensaje cuando no hay noticias.
  String get noNoticias;
  // Subtítulo de novedades.
  String get novedades;
  // Título de favoritos.
  String get favoritos;
  // Mensaje cuando no hay favoritos.
  String get noNoFavoritos;
  // Título de animales.
  String get animales;
  // Mensaje cuando no hay animales disponibles.
  String get noAnimales;

  // --- Textos de LoginPage ---
  // Mensaje de error en inicio de sesión.
  String get errorSesion;
  // Texto de bienvenida a la aplicación.
  String get bienvenida;
  // Instrucción para introducir usuario y contraseña.
  String get usuarioContrasenya;
  // Campo de formulario para contraseña.
  String get contrasenya;
  // Botón para iniciar sesión.
  String get iniciarSesion;

  // --- Textos AnimalController ---
  // Mensaje cuando se crea un animal correctamente.
  String get animalCreado;
  // Mensaje cuando se actualiza un animal.
  String get animalActualizado;
  // Título del diálogo de confirmación de eliminación.
  String get confirmarEliminacion;
  // Pregunta de confirmación al eliminar un animal.
  String preguntaEliminacion(String name);
  // Botón cancelar en diálogo.
  String get cancelar;
  // Botón eliminar en diálogo.
  String get eliminar;
  // Mensaje cuando un animal se elimina correctamente.
  String get animalEliminado;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'es', 'it'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'it':
      return AppLocalizationsIt();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
