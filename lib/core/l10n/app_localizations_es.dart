// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  // --- Textos generales ---
  @override
  String get appTitle => 'Patitas Felices';

  @override
  String hello(String name) {
    return '¡Hola, $name!';
  }

  @override
  String get conocer => 'Conoce a';

  @override
  String get inicio => 'Inicio';

  @override
  String get invitado => 'Invitado';

  @override
  String get sinCorreo => 'Sin correo';

  String get noLoggin => 'No hay usuario logeado';

  @override
  String get guardado => 'Guardado';

  @override
  String get idioma => 'Idioma';

  @override
  String get selecIdioma => 'Cambiar Idioma';

  @override
  String get apariencia => "Apariencia";

  @override
  String get modoOsc => "Modo Oscuro";

  @override
  String get namePagesGestion => 'Gestión de Páginas';

  @override
  String get pagCatalogo => 'Página de Catálogo';

  @override
  String get si => 'Sí';

  @override
  String get no => 'No';

  // --- Textos de drawerPage ---
  @override
  String get preferencias => 'Preferencias';

  @override
  String get catalogo => 'Catálogo';

  @override
  String get cerrarSesion => 'Cerrar Sesión';

  // --- Textos de Datos Usuario ---
  @override
  String get datosUsuario => 'Datos de Usuario';

  @override
  String get usuario => 'Usuario';

  @override
  String get fechaNacimiento => 'Fecha de Nacimiento';

  @override
  String get nombreAdoptante => 'Nombre del Adoptante';

  @override
  String get apellido1 => 'Primer Apellido';

  @override
  String get apellido2 => 'Segundo Apellido';

  @override
  String get dni => 'DNI';

  @override
  String get telefono => 'Teléfono';

  @override
  String get correo => 'Correo Electrónico';

  @override
  String get direccion => 'Dirección';

  @override
  String get cp => 'Código Postal';

  @override
  String get localidad => 'Localidad';

  @override
  String get provincia => 'Provincia';

  // --- Textos de Datos Animales ---

  @override
  String get filtrarPor => "Filtrar Por";

  @override
  String get limpiarFiltro => "Limpiar Filtro";

  @override
  String get nombre => 'Nombre';

  @override
  String get chipAnimal => 'Chip';

  @override
  String get sexoAnimal => 'Sexo';

  @override
  String get macho => 'Macho';

  @override
  String get hembra => 'Hembra';

  @override
  String get razaAnimal => 'Raza';

  @override
  String get tipoAnimal => 'Tipo';

  @override
  String get perro => 'Perro';

  @override
  String get gato => 'Gato';

  @override
  String get otro => 'Otro';

  @override
  String get esterelizadoAnimal => 'Esterelizado';

  @override
  String get fotoAnimal => 'Foto';

  @override
  String get descripcionAnimal => 'Descripción Breve';

  // --- Textos Botones ---
  @override
  String get botonAciones => 'Gestionar Animales';

  @override
  String get enviarSolicitud => 'Enviar Solicitud';

  @override
  String get adoptar => 'Adoptar';

  @override
  String get buttonProfile => 'Profile';

  // --- Textos de HomePage ---

  @override
  String get totalAdop => 'Total de Solicitudes de Adopción';

  @override
  String get revisarAdop => 'Adopciones por revisar:';

  @override
  String get visitaVeterinario => 'Visita Veterinario';

  @override
  String get acciones => 'Acciones';

  @override
  String get actividadReciente => 'Actividad Reciente';

  @override
  String get sinActividadReciente => 'No hay adopciones registradas todavía.';

  @override
  String get solicitudAdopcion => '- Solicitud de Adopción';

  @override
  String get adopcion => 'Adopción';

  // --- Textos de Formulario Adopción ---
  @override
  String get avisoSolicitudGuardada => 'Solicitud guardada correctamente';

  @override
  String get solicitudCreada => 'Solicitud de adopción creada correctamente';

  @override
  String get preguntEliAdop =>
      '¿Estás seguro de que quieres eliminar esta adopción?';

  @override
  String get solicitudEliminada => 'Adopción eliminada correctamente';

  @override
  String get noAnimalSelect => 'No hay animal seleccionado';

  @override
  String get tituloFormulario => 'Formulario Adopción';

  @override
  String get chipDuplicado => 'Ya existe un animal con este chip';

  @override
  String get animalNoEncontrado => 'Animal no encontrado';

  @override
  String get nombreObligatorio => 'El Nombre es obligatorio';

  @override
  String get obligatorioApellido1 => 'El Primer Apellido es obligatorio';

  @override
  String get obligatorioApellido2 => 'El Segundo Apellido es obligatorio';

  @override
  String get obligatorioDni => 'El DNI es obligatorio';

  @override
  String get formatoDni => 'Formato de DNI inválido (12345678A)';

  @override
  String get obligatorioTelefono => 'El Teléfono es obligatorio';

  @override
  String get formatoNum => 'Se esperaba un valor numérico';

  @override
  String get obligatorioCorreo => 'El correo es obligatorio';

  @override
  String get formatoCorreo => 'Formato de correo no válido';

  @override
  String get obligatorioDireccion => 'La Dirección es obligatoria';

  @override
  String get obligatorioCp => 'El CP es obligatorio';

  @override
  String get obligLocalidad => 'La Localidad es obligatoria';

  @override
  String get obligProvincia => 'La Provincia es obligatoria';

  // --- Textos de CRUDAnimalPage ---
  @override
  String get gestionarAnimales => 'Gestionar Animales';

  @override
  String get noAnimalesRegistrados => 'No hay animales registrados';

  @override
  String get selecEdicion => 'Selecciona un animal para editar';

  @override
  String get selecSexo => 'Selecciona sexo';

  @override
  String get razaOblig => 'Raza obligatoria';

  @override
  String get tipoOblig => 'Selecciona el tipo';

  @override
  String get fechaOblig => 'Fecha obligatoria';

  @override
  String get fotoOblig => 'Foto obligatoria';

  @override
  String get descOblig => 'La descripción es obligatoria';

  @override
  String get descLong => 'La descripción no puede superar los 50 caracteres';

  @override
  String get crearAnimal => 'Crear';

  @override
  String get guardarCambios => 'Guardar';

  // --- Textos de ClientePage ---

  @override
  String get noticiasEventos => 'Noticias y Eventos';

  @override
  String get noNoticias => 'No hay noticias todavía.';

  @override
  String get novedades => 'Novedades';

  @override
  String get favoritos => 'Favoritos';

  @override
  String get noNoFavoritos => 'No tienes animales favoritos todavía.';

  @override
  String get animales => 'Animales';

  @override
  String get noAnimales => 'No hay animales disponibles en este momento.';

  // --- Textos de LoginPage ---

  @override
  String get errorSesion => 'Inicio de sesión fallido:';

  @override
  String get bienvenida => 'Bienvenido a';

  @override
  String get usuarioContrasenya =>
      'Introduce tu usuario y contraseña para continuar.';

  @override
  String get contrasenya => 'Contraseña';

  @override
  String get iniciarSesion => 'Iniciar sesión';

  // --- Textos AnimalController ---

  @override
  String get animalCreado => 'Animal creado correctamente';

  @override
  String get animalActualizado => 'Animal actualizado correctamente';

  @override
  String get confirmarEliminacion => 'Confirmar eliminación';

  @override
  String preguntaEliminacion(String name) {
    return '¿Estás seguro de que quieres eliminar a $name?';
  }

  @override
  String get cancelar => 'Cancelar';

  @override
  String get eliminar => 'Eliminar';

  @override
  String get animalEliminado => 'Animal eliminado correctamente';
}
