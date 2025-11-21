import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;
import 'package:proyecto_protectora/features/protectora/presentation/pages/crear_editar_animal.dart';

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
  String get appTitle;
  // String hello(String name);

  // --- Textos generales ---
  String get inicio;

  // /// Placeholder de fecha formateada según la configuración regional
  // String dueDate(DateTime date);

  // /// Placeholder de número con formato de moneda
  // String price(num amount);

  /// Texto del botón para abrir el selector de idioma
  String get openLanguagePicker;

  /// Título de gestión de páginas
  String get namePagesGestion;

  // --- Textos específicos de HomePage ---
  String get welcome; // Bienvenido
  String get loginButton; // Login
  String get catalogButton; // Página de Catálogo
  // --- Home ---
  String get visitaveterinario; // cart home notificacion
  String get visitaveterinarioText; // cart home notificacion texto
  String get visitaveterinarioTextButton; // cart home notificaciones text del boton
  String get acciones; // titulo de acciones
  String get botonAciones; // titulo de accion del boton
  String get actividadReciente; //titulo de actividad reciente
  String get sinActividadReciente; // titulo cuando no hay actividad reciente
  String get solicitudAdopcion; // solicitud de adopcion
  String get adopcion; //texto del boton de adopcion
  // ---Formulario---
  String get avisosolicitudguardada; // aviso de solicitud guardada correctamente
  String get tituloFormulario; // Titulo principal del formulario
  String get animalnoencontrado; // mensaje cuando no encuentre el animal
  String get nombreAnimal; // input que indica el nombre del animal
  String get chipAnimal; // input que indica el chip del animal
  String get nombreAdoptante; // input que indica el nombre del adoptante
  String get comprobantenombreAdoptante; // comprobante que ha puesto el nombre
  String get primerApellidoAdoptante; // input que indica el primer apellido del adoptante
  String get comprobantePrimerApellidoAdoptante; // comprobar que ha puesto el primer apellido
  String get segundoApellidoAdoptante; // input que indica el segundo apellido del adoptante
  String get comprobanteSegundoApellidoAdoptante; // comprobar que ha puesto el segundo apellido
  String get DNIAdoptante; // input que indica el DNI del adoptante
  String get comprobanteDNIAdoptante; // comprobante de que se ha puesto el DNI
  String get comprobanteFormatoDNIAdoptante; // comprobante de que el formato sea el correcto
  String get telefonoAdoptante; // input que indica el telefono del adoptante
  String get comprobantetelefonoAdoptante; // comporbante de que se ha puesto un numero de telefono
  String get comprobanteFormatotelefonoAdoptante; // comporbante de que el formato del numero sea el correcto
  String get correoAdoptante;// input que indica el correo electronico del adoptante
  String get comporbanteCorreoAdoptante; // comprobante de que se haya puesto un correo electronico
  String get comporbanteFormatoCorreoAdoptante; // comoprobante del formato del correo electronico del adoptante
  String get direccionAdoptante;//  input que indica la direccion del correo electronico del adoptante
  String get comprobanteDireccionAdoptante; // comprobante de que ha puesto la direccion
  String get codigopostalAdoptante; // input que indica el codigo postal del adoptante
  String get comprobanteCodigopostalAdoptante; // comprobante de que se ha introducido el codigo postal
  String get comprobanteFormatoCodigopostalAdoptante; // comporbante del formato del codigo postal sea el correcto
  String get localidadAdoptante; // input que indica la localidad del adoptante
  String get comprobantelocalidadAdoptante; // comprobante de que se ha puesto la localidad
  String get provinciaAdoptante; // input que indica la provincia del adoptante
  String get comprobanteProvinciaAdoptante; // comprobante de que se ha introducido la provincia
  String get enviarSolicitud; // texto del boton de enviar solicitud
  // --- Detalle ---
  String get conocer; // texto del titulo de conocer a
  // --- Datos del usuario ---
  String get tituloDatos; // titulo de la pagina datos del usuario
  String get usuario; // input que indica el usuario
  String get fechaNacimiento; // input que indica la fecha de nacimiento del usuario
  // --- CrearEditarAnimal ---
  String get gestionarAnimales; // titulo de la pagina de crear editar animal
  String get noAnimalesRegistrados; // mensaje cuando no hay animales registrados
  String get seleccionarAnimalEdicion; // selecciona un animal para editarlo
  String get sexoAnimal; // input que indica el sexo del animal
  String get fechaNacimientoAnimal; //input que indica la fecha de nacimiento del animal
  String get razaAnimal; //input que indica la raza del animal
  String get tipoAnimal; //input que indica el tipo de animal
  String get esterelizadoAnimal; //input que indica si el animal esta esterelizado
  String get fotoAnimal; //input que indica la foto del animal
  String get descripcionAnimal; //input que indica la descripcion del animal
  String get crearAnimal; //boton de crear animal
  String get guardarCambiosAnimal; // boton de guardar cambios del animal
  String get eliminarAnimal; // boton de eliminar animal
  // --- ClientePage ---
  String get noticiasEventos; // titulo de noticias y eventos
  String get tituloProtectora; // titulo de la pagina cliente
  String get subtituloNovedades; // subtitulo de la pagina cliente
  // --- FavoritosPage ---
  String get tituloFavoritos; // titulo de la pagina favoritos
  // --- AnimalesPage --- 
  String get tituloAnimales; // titulo de la pagina animales
  // --- drawerPage ---
  String get noUsuarioLogeado; // no hay un usuario logeado
  String get preferencias; // preferencias 
  String get drawerCatalogo; // catalogo
  String get cerrarSesion; // texto del boton de cerrar sesion
  // --- loginPage ---
  String get mensajeError; // mensaje de error 
  String get bienvenidoProtectora; // titulo de bienvenido a la aplicacion
  String get usuarioContrasenya; // indica al usuario que debe de introducir el usuario y contraseña
  String get contrasenya; // input para introducir la contraseña
  String get iniciarSesion; // texto del boton para iniciar sesion
  // --- cartFavoritos ---
  String get adoptar; // boton de adoptar
  // --- AnimalController ---
  String get animalCreado; // texto cuando crear un animal correctamente
  String get animalActualizado; // texto de animal actualizado
  String get confirmarEliminacion; // texto de confirmar eliminacion
  String get preguntarConfirmarEliminacion; // pregunta si estas seguro que quieres eliminar al animal
  String get cancelar; // texto del boton cancelar
  String get eliminar; // texto del boton eliminar
  String get animalEliminadoCorrectamente; // notificacion de que el animal a sido eliminado correctamente
  // --- MenuButons ---
  String get buttonProfolio; // texto del boton porfolio
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
