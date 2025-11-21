// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  // --- Textos generales ---
  @override
  String get appTitle => 'Protectora';

  @override
  String get inicio => 'Inicio';

  @override
  String get openLanguagePicker => 'Cambiar idioma';

  @override
  String get namePagesGestion => 'Gestión de páginas';

  // --- Textos de HomePage ---
  @override
  String get welcome => 'Bienvenido';

  @override
  String get visitaveterinario => 'Visita Veterinario';

  @override
  String get visitaveterinarioText =>
      'Tienes 2 visitas al veterniario esta semana.';

  @override
  String get visitaveterinarioTextButton => 'Revisar';

  @override
  String get acciones => 'Acciones';

  @override
  String get botonAciones => 'Gestionar Animales';

  @override
  String get actividadReciente => 'Actividad reciente';

  @override
  String get sinActividadReciente => 'No hay adopciones registradas todavía.';

  @override
  String get solicitudAdopcion => ' - Solicitud de Adopción';

  @override
  String get adopcion => 'Adopción';

  // --- Textos de FormularioPage ---

  @override
  String get avisosolicitudguardada => 'Solicitud guardada correctamente';

  @override
  String get tituloFormulario => 'Formulario Adopción';

  @override
  String get animalnoencontrado => 'Animal no encontrado';

  @override
  String get nombreAnimal => 'Nombre del animal';

  @override
  String get chipAnimal => 'Chip del animal';

  @override
  String get nombreAdoptante => 'Nombre del Adoptante';

  @override
  String get comprobantenombreAdoptante => 'El Nombre es obligatorio';

  @override
  String get primerApellidoAdoptante => 'Primer apellido';

  @override
  String get comprobantePrimerApellidoAdoptante =>
      'El Primer Apellido es obligatorio';

  @override
  String get segundoApellidoAdoptante => 'Segundo apellido';

  @override
  String get comprobanteSegundoApellidoAdoptante =>
      'El Segundo Apellido es obligatorio';

  @override
  String get DNIAdoptante => 'DNI';

  @override
  String get comprobanteDNIAdoptante => 'El DNI es obligatorio';

  @override
  String get comprobanteFormatoDNIAdoptante =>
      'Formato de DNI inválido (12345678A)';

  @override
  String get telefonoAdoptante => 'Teléfono';

  @override
  String get comprobantetelefonoAdoptante => 'El Teléfono es obligatorio';

  @override
  String get comprobanteFormatotelefonoAdoptante =>
      'Se esperaba un valor numérico';

  @override
  String get correoAdoptante => 'Correo electrónico';

  @override
  String get comporbanteCorreoAdoptante => 'El correo es obligatorio';

  @override
  String get comporbanteFormatoCorreoAdoptante => 'Formato de correo no válido';

  @override
  String get direccionAdoptante => 'Dirección';

  @override
  String get comprobanteDireccionAdoptante => 'La Dirección es obligatoria';

  @override
  String get codigopostalAdoptante => 'Código postal';

  @override
  String get comprobanteCodigopostalAdoptante => 'El CP es obligatorio';

  @override
  String get comprobanteFormatoCodigopostalAdoptante =>
      'Se esperaba un valor numérico';

  @override
  String get localidadAdoptante => 'Localidad';

  @override
  String get comprobantelocalidadAdoptante => 'La Localidad es obligatoria';

  @override
  String get provinciaAdoptante => 'Provincia';

  @override
  String get comprobanteProvinciaAdoptante => 'La Provincia es obligatoria';

  @override
  String get enviarSolicitud => 'Enviar Solicitud';

  // --- Textos de DetallePage ---

  @override
  String get conocer => 'Conoce a';

  // --- Textos de Datos usuario Page ---

  @override
  String get tituloDatos => 'Datos de Usuario';

  @override
  String get usuario => 'Usuario';

  @override
  String get fechaNacimiento => 'Fecha de nacimiento';

  // --- Textos de CrearEditarAnimalPage ---
  @override
  String get gestionarAnimales => 'Gestionar Animales';

  @override
  String get noAnimalesRegistrados => 'No hay animales registrados';

  @override
  String get seleccionarAnimalEdicion => 'Selecciona un animal para editar';

  @override
  String get sexoAnimal => 'Sexo';

  @override
  String get fechaNacimientoAnimal => 'Fecha de nacimiento';

  @override
  String get razaAnimal => 'Raza';

  @override
  String get tipoAnimal => 'Tipo';

  @override
  String get esterelizadoAnimal => 'Esterelizado';

  @override
  String get fotoAnimal => 'Foto';

  @override
  String get descripcionAnimal => 'Descripcion';

  @override
  String get crearAnimal => 'Crear Animal';

  @override
  String get guardarCambiosAnimal => 'Guardar Cambios';

  @override
  String get eliminarAnimal => 'Eliminar Animal';

  @override
  String get loginButton => 'Iniciar sesion';

  @override
  String get catalogButton => 'Página de Catálogo';

  // --- Textos de ClientePage ---

  @override
  String get noticiasEventos => 'Noticias y Eventos';

  @override
  String get tituloProtectora => 'Protectora';

  @override
  String get subtituloNovedades => 'Novedades';

  // --- Textos de FavoritosPage ---

  @override
  String get tituloFavoritos => 'Favoritos';

  // --- Textos de AnimalesPage ---

  @override
  String get tituloAnimales => 'Animales';

  // --- Textos de drawerPage ---

  @override
  String get noUsuarioLogeado => 'No hay usuario logeado';

  @override
  String get preferencias => 'Preferencias';

  @override
  String get drawerCatalogo => 'Catálogo';

  @override
  String get cerrarSesion => 'Cerrar sesión';

  // --- Textos de LoginPage ---

  @override
  String get mensajeError => 'Inicio de sesión fallido:';

  @override
  String get bienvenidoProtectora => 'Bienvenido a Protectora';

  @override
  String get usuarioContrasenya =>
      'Introduce tu usuario y contraseña para continuar.';

  @override
  String get contrasenya => 'Contraseña';

  @override
  String get iniciarSesion => 'Iniciar sesión';
  // --- Textos de card de favoritos ---

  @override
  String get adoptar => 'Adoptar';

  // --- Textos AnimalController ---

  @override
  String get animalCreado => 'Animal creado correctamente';

  @override
  String get animalActualizado => 'Animal actualizado correctamente';

  @override
  String get confirmarEliminacion => 'Confirmar eliminación';

  @override
  String get preguntarConfirmarEliminacion =>
      '¿Estás seguro de que quieres eliminar a';

  @override
  String get cancelar => 'Cancelar';

  @override
  String get eliminar => 'Eliminar';

  @override
  String get animalEliminadoCorrectamente => 'Animal eliminado correctamente';

  // --- Texto MenuButons ---

  @override
  String get buttonProfolio => 'Profile';

  // @override
  // String hello(String name) {
  //   return '¡Hola, $name!';
  // }

  // @override
  // String dueDate(DateTime date) {
  //   final intl.DateFormat dateDateFormat = intl.DateFormat.yMMMd(localeName);
  //   final String dateString = dateDateFormat.format(date);
  //   return 'Vence el $dateString';
  // }

  // @override
  // String price(num amount) {
  //   final intl.NumberFormat amountNumberFormat = intl.NumberFormat.currency(
  //     locale: localeName,
  //     name: 'EUR',
  //   );
  //   final String amountString = amountNumberFormat.format(amount);
  //   return 'Total: $amountString';
  // }
}
