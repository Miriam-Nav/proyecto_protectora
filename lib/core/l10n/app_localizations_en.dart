// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);
  // --- Textos generales ---
  @override
  String get appTitle => 'Shelter';

  @override
  String get inicio => 'Home';

  @override
  String get openLanguagePicker => 'Change language';

  @override
  String get namePagesGestion => 'Page Management';

  // --- HomePage Texts ---
  @override
  String get welcome => 'Welcome';

  @override
  String get visitaveterinario => 'Veterinary Visit';

  @override
  String get visitaveterinarioText => 'You have 2 veterinary visits this week.';

  @override
  String get visitaveterinarioTextButton => 'Review';

  @override
  String get acciones => 'Actions';

  @override
  String get botonAciones => 'Manage Animals';

  @override
  String get actividadReciente => 'Recent Activity';

  @override
  String get sinActividadReciente => 'No adoptions registered yet.';

  @override
  String get solicitudAdopcion => ' - Adoption Request';

  @override
  String get adopcion => 'Adoption';

  @override
  String get loginButton => 'Login';

  @override
  String get catalogButton => 'Catalog Page';

  // --- FormularioPage Texts ---
  @override
  String get avisosolicitudguardada => 'Request saved successfully';

  @override
  String get tituloFormulario => 'Adoption Form';

  @override
  String get animalnoencontrado => 'Animal not found';

  @override
  String get nombreAnimal => 'Animal Name';

  @override
  String get chipAnimal => 'Animal Chip';

  @override
  String get nombreAdoptante => 'Adopter Name';

  @override
  String get comprobantenombreAdoptante => 'Name is required';

  @override
  String get primerApellidoAdoptante => 'First Surname';

  @override
  String get comprobantePrimerApellidoAdoptante => 'First Surname is required';

  @override
  String get segundoApellidoAdoptante => 'Second Surname';

  @override
  String get comprobanteSegundoApellidoAdoptante =>
      'Second Surname is required';

  @override
  String get DNIAdoptante => 'ID Number';

  @override
  String get comprobanteDNIAdoptante => 'ID Number is required';

  @override
  String get comprobanteFormatoDNIAdoptante => 'Invalid ID format (12345678A)';

  @override
  String get telefonoAdoptante => 'Phone';

  @override
  String get comprobantetelefonoAdoptante => 'Phone is required';

  @override
  String get comprobanteFormatotelefonoAdoptante =>
      'A numeric value was expected';

  @override
  String get correoAdoptante => 'Email';

  @override
  String get comporbanteCorreoAdoptante => 'Email is required';

  @override
  String get comporbanteFormatoCorreoAdoptante => 'Invalid email format';

  @override
  String get direccionAdoptante => 'Address';

  @override
  String get comprobanteDireccionAdoptante => 'Address is required';

  @override
  String get codigopostalAdoptante => 'Postal Code';

  @override
  String get comprobanteCodigopostalAdoptante => 'Postal Code is required';

  @override
  String get comprobanteFormatoCodigopostalAdoptante =>
      'A numeric value was expected';

  @override
  String get localidadAdoptante => 'City';

  @override
  String get comprobantelocalidadAdoptante => 'City is required';

  @override
  String get provinciaAdoptante => 'Province';

  @override
  String get comprobanteProvinciaAdoptante => 'Province is required';

  @override
  String get enviarSolicitud => 'Submit Request';

  // --- DetallePage Texts ---
  @override
  String get conocer => 'Meet';

  // --- User Data Page Texts ---
  @override
  String get tituloDatos => 'User Data';

  @override
  String get usuario => 'User';

  @override
  String get fechaNacimiento => 'Date of Birth';

  // --- CrearEditarAnimalPage Texts ---

  @override
  String get gestionarAnimales => 'Manage Animals';

  @override
  String get noAnimalesRegistrados => 'No animals registered';

  @override
  String get seleccionarAnimalEdicion => 'Select an animal to edit';

  @override
  String get sexoAnimal => ' Sex';

  @override
  String get fechaNacimientoAnimal => 'Date of Birth';

  @override
  String get razaAnimal => 'Breed';

  @override
  String get tipoAnimal => 'Type';

  @override
  String get esterelizadoAnimal => 'Neutered';

  @override
  String get fotoAnimal => 'Photo';

  @override
  String get descripcionAnimal => 'Description';

  @override
  String get crearAnimal => 'Create Animal';

  @override
  String get guardarCambiosAnimal => 'Save Changes';

  @override
  String get eliminarAnimal => 'Delete Animal';

  // --- ClientePage Texts ---

  @override
  String get noticiasEventos => 'News and Events';

  @override
  String get tituloProtectora => 'Shelter';

  @override
  String get subtituloNovedades => 'News';

  // --- FavoritosPage Texts ---
  @override
  String get tituloFavoritos => 'Favorites';

  // --- AnimalesPage Texts ---
  @override
  String get tituloAnimales => 'Animals';

  // --- DrawerPage Texts ---
  @override
  String get noUsuarioLogeado => 'No user logged in';

  @override
  String get preferencias => 'Preferences';

  @override
  String get drawerCatalogo => 'Catalog';

  @override
  String get cerrarSesion => 'Log out';

  // --- LoginPage Texts ---
  @override
  String get mensajeError => 'Login failed:';

  @override
  String get bienvenidoProtectora => 'Welcome to Shelter';

  @override
  String get usuarioContrasenya =>
      'Enter your username and password to continue.';

  @override
  String get contrasenya => 'Password';

  @override
  String get iniciarSesion => 'Log in';

  // --- Textos de card de favoritos ---

  @override
  String get adoptar => 'Adopt';

  // --- AnimalController Texts ---

  @override
  String get animalCreado => 'Animal created successfully';

  @override
  String get animalActualizado => 'Animal updated successfully';

  @override
  String get confirmarEliminacion => 'Confirm deletion';

  @override
  String get preguntarConfirmarEliminacion => 'Are you sure you want to delete';

  @override
  String get cancelar => 'Cancel';

  @override
  String get eliminar => 'Delete';

  @override
  String get animalEliminadoCorrectamente => 'Animal deleted successfully';

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
