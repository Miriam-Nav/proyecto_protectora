// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  // --- General Texts ---
  @override
  String get appTitle => 'Happy Paws';

  @override
  String hello(String name) {
    return 'Hello, $name!';
  }

  @override
  String get conocer => 'Meet';

  @override
  String get inicio => 'Home';

  @override
  String get invitado => 'Guest';

  @override
  String get sinCorreo => 'No email';

  String get noLoggin => 'No user logged in';

  @override
  String get guardado => 'Saved';

  @override
  String get idioma => 'Language';

  @override
  String get selecIdioma => 'Change Language';

  @override
  String get apariencia => "Appearance";

  @override
  String get modoOsc => "Dark Mode";

  @override
  String get namePagesGestion => 'Page Management';

  @override
  String get pagCatalogo => 'Catalog Page';

  @override
  String get si => 'Yes';

  @override
  String get no => 'No';

  // --- DrawerPage Texts ---
  @override
  String get preferencias => 'Preferences';

  @override
  String get catalogo => 'Catalog';

  @override
  String get cerrarSesion => 'Log Out';

  // --- User Data Texts ---
  @override
  String get datosUsuario => 'User Data';

  @override
  String get usuario => 'User';

  @override
  String get fechaNacimiento => 'Date of Birth';

  @override
  String get nombreAdoptante => 'Adopter Name';

  @override
  String get apellido1 => 'First Last Name';

  @override
  String get apellido2 => 'Second Last Name';

  @override
  String get dni => 'ID';

  @override
  String get telefono => 'Phone';

  @override
  String get correo => 'Email';

  @override
  String get direccion => 'Address';

  @override
  String get cp => 'Postal Code';

  @override
  String get localidad => 'City';

  @override
  String get provincia => 'Province';

  // --- Animal Data Texts ---
  @override
  String get nombre => 'Name';

  @override
  String get chipAnimal => 'Chip';

  @override
  String get sexoAnimal => 'Gender';

  @override
  String get macho => 'Male';

  @override
  String get hembra => 'Female';

  @override
  String get razaAnimal => 'Breed';

  @override
  String get tipoAnimal => 'Type';

  @override
  String get perro => 'Dog';

  @override
  String get gato => 'Cat';

  @override
  String get otro => 'Other';

  @override
  String get esterelizadoAnimal => 'Sterilized';

  @override
  String get fotoAnimal => 'Photo';

  @override
  String get descripcionAnimal => 'Brief Description';

  // --- Buttons Texts ---
  @override
  String get botonAciones => 'Manage Animals';

  @override
  String get enviarSolicitud => 'Send Request';

  @override
  String get adoptar => 'Adopt';

  @override
  String get buttonProfile => 'Profile';

  // --- HomePage Texts ---
  @override
  String get totalAdop => 'Total Adoption Requests';

  @override
  String get revisarAdop => 'Adoptions to Review:';

  @override
  String get visitaVeterinario => 'Veterinary Visit';

  @override
  String get acciones => 'Actions';

  @override
  String get actividadReciente => 'Recent Activity';

  @override
  String get sinActividadReciente => 'No adoptions registered yet.';

  @override
  String get solicitudAdopcion => '- Adoption Request';

  @override
  String get adopcion => 'Adoption';

  // --- Adoption Form Texts ---
  @override
  String get avisoSolicitudGuardada => 'Request saved successfully';

  @override
  String get solicitudCreada => 'Adoption request created successfully';

  @override
  String get preguntEliAdop => 'Are you sure you want to delete this adoption?';

  @override
  String get solicitudEliminada => 'Adoption deleted successfully';

  @override
  String get noAnimalSelect => 'No animal selected';

  @override
  String get tituloFormulario => 'Adoption Form';

  @override
  String get chipDuplicado => 'An animal with this chip already exists';

  @override
  String get animalNoEncontrado => 'Animal not found';

  @override
  String get nombreObligatorio => 'Name is required';

  @override
  String get obligatorioApellido1 => 'First Last Name is required';

  @override
  String get obligatorioApellido2 => 'Second Last Name is required';

  @override
  String get obligatorioDni => 'ID is required';

  @override
  String get formatoDni => 'Invalid ID format (12345678A)';

  @override
  String get obligatorioTelefono => 'Phone is required';

  @override
  String get formatoNum => 'A numeric value was expected';

  @override
  String get obligatorioCorreo => 'Email is required';

  @override
  String get formatoCorreo => 'Invalid email format';

  @override
  String get obligatorioDireccion => 'Address is required';

  @override
  String get obligatorioCp => 'Postal Code is required';

  @override
  String get obligLocalidad => 'City is required';

  @override
  String get obligProvincia => 'Province is required';

  // --- CRUDAnimalPage Texts ---
  @override
  String get gestionarAnimales => 'Manage Animals';

  @override
  String get noAnimalesRegistrados => 'No animals registered';

  @override
  String get selecEdicion => 'Select an animal to edit';

  @override
  String get selecSexo => 'Select gender';

  @override
  String get razaOblig => 'Breed is required';

  @override
  String get tipoOblig => 'Select type';

  @override
  String get fechaOblig => 'Date is required';

  @override
  String get fotoOblig => 'Photo is required';

  @override
  String get descOblig => 'Description is required';

  @override
  String get descLong => 'Description cannot exceed 50 characters';

  @override
  String get crearAnimal => 'Create';

  @override
  String get guardarCambios => 'Save';

  // --- ClientPage Texts ---
  @override
  String get noticiasEventos => 'News and Events';

  @override
  String get noNoticias => 'No news yet.';

  @override
  String get novedades => 'Updates';

  @override
  String get favoritos => 'Favorites';

  @override
  String get noNoFavoritos => 'You have no favorite animals yet.';

  @override
  String get animales => 'Animals';

  @override
  String get noAnimales => 'No animals available at the moment.';

  // --- LoginPage Texts ---
  @override
  String get errorSesion => 'Login failed:';

  @override
  String get bienvenida => 'Welcome to';

  @override
  String get usuarioContrasenya =>
      'Enter your username and password to continue.';

  @override
  String get contrasenya => 'Password';

  @override
  String get iniciarSesion => 'Log In';

  // --- AnimalController Texts ---
  @override
  String get animalCreado => 'Animal created successfully';

  @override
  String get animalActualizado => 'Animal updated successfully';

  @override
  String get confirmarEliminacion => 'Confirm deletion';

  @override
  String preguntaEliminacion(String name) {
    return 'Are you sure you want to delete $name?';
  }

  @override
  String get cancelar => 'Cancel';

  @override
  String get eliminar => 'Delete';

  @override
  String get animalEliminado => 'Animal deleted successfully';
}
