// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  // --- Textos generales ---

  @override
  String get appTitle => 'Protezione';

  @override
  String get inicio => 'Inizio';

  @override
  String get openLanguagePicker => 'Cambia lingua';

  @override
  String get namePagesGestion => 'Gestione delle pagine';

  // --- Textos de HomePage ---
  @override
  String get welcome => 'Benvenuto';

  @override
  String get visitaveterinario => 'Visita Veterinaria';

  @override
  String get visitaveterinarioText =>
      'Hai 2 visite veterinarie questa settimana.';

  @override
  String get visitaveterinarioTextButton => 'Rivedi';

  @override
  String get acciones => 'Azioni';

  @override
  String get botonAciones => 'Gestisci Animali';

  @override
  String get actividadReciente => 'Attività recente';

  @override
  String get sinActividadReciente => 'Non ci sono ancora adozioni registrate.';

  @override
  String get solicitudAdopcion => ' - Richiesta di Adozione';

  @override
  String get adopcion => 'Adozione';

  // --- Textos de FormularioPage ---
  @override
  String get avisosolicitudguardada => 'Richiesta salvata correttamente';

  @override
  String get tituloFormulario => 'Modulo di Adozione';

  @override
  String get animalnoencontrado => 'Animale non trovato';

  @override
  String get nombreAnimal => 'Nome dell\'animale';

  @override
  String get chipAnimal => 'Chip dell\'animale';

  @override
  String get nombreAdoptante => 'Nome dell\'Adottante';

  @override
  String get comprobantenombreAdoptante => 'Il Nome è obbligatorio';

  @override
  String get primerApellidoAdoptante => 'Primo cognome';

  @override
  String get comprobantePrimerApellidoAdoptante =>
      'Il Primo Cognome è obbligatorio';

  @override
  String get segundoApellidoAdoptante => 'Secondo cognome';

  @override
  String get comprobanteSegundoApellidoAdoptante =>
      'Il Secondo Cognome è obbligatorio';

  @override
  String get DNIAdoptante => 'Documento d\'identità';

  @override
  String get comprobanteDNIAdoptante => 'Il Documento è obbligatorio';

  @override
  String get comprobanteFormatoDNIAdoptante =>
      'Formato del documento non valido (12345678A)';

  @override
  String get telefonoAdoptante => 'Telefono';

  @override
  String get comprobantetelefonoAdoptante => 'Il Telefono è obbligatorio';

  @override
  String get comprobanteFormatotelefonoAdoptante =>
      'Era previsto un valore numerico';

  @override
  String get correoAdoptante => 'Email';

  @override
  String get comporbanteCorreoAdoptante => 'L\'Email è obbligatoria';

  @override
  String get comporbanteFormatoCorreoAdoptante => 'Formato email non valido';

  @override
  String get direccionAdoptante => 'Indirizzo';

  @override
  String get comprobanteDireccionAdoptante => 'L\'Indirizzo è obbligatorio';

  @override
  String get codigopostalAdoptante => 'Codice postale';

  @override
  String get comprobanteCodigopostalAdoptante => 'Il CAP è obbligatorio';

  @override
  String get comprobanteFormatoCodigopostalAdoptante =>
      'Era previsto un valore numerico';

  @override
  String get localidadAdoptante => 'Località';

  @override
  String get comprobantelocalidadAdoptante => 'La Località è obbligatoria';

  @override
  String get provinciaAdoptante => 'Provincia';

  @override
  String get comprobanteProvinciaAdoptante => 'La Provincia è obbligatoria';

  @override
  String get enviarSolicitud => 'Invia Richiesta';

  // --- Textos de DetallePage ---
  @override
  String get conocer => 'Conosci';

  // --- Textos de Datos usuario Page ---
  @override
  String get tituloDatos => 'Dati Utente';

  @override
  String get usuario => 'Utente';

  @override
  String get fechaNacimiento => 'Data di nascita';

  // --- Textos de CrearEditarAnimalPage ---
  @override
  String get gestionarAnimales => 'Gestisci Animali';

  @override
  String get noAnimalesRegistrados => 'Nessun animale registrato';

  @override
  String get seleccionarAnimalEdicion => 'Seleziona un animale da modificare';

  @override
  String get sexoAnimal => ' Sesso';

  @override
  String get fechaNacimientoAnimal => 'Data di nascita';

  @override
  String get razaAnimal => 'Razza';

  @override
  String get tipoAnimal => 'Tipo';

  @override
  String get esterelizadoAnimal => 'Sterilizzato';

  @override
  String get fotoAnimal => 'Foto';

  @override
  String get descripcionAnimal => 'Descrizione';

  @override
  String get crearAnimal => 'Crea Animale';

  @override
  String get guardarCambiosAnimal => 'Salva Modifiche';

  @override
  String get eliminarAnimal => 'Elimina Animale';

  @override
  String get loginButton => 'Accedi';

  @override
  String get catalogButton => 'Pagina del Catalogo';

  // --- Textos de ClientePage ---
  @override
  String get noticiasEventos => 'Notizie ed Eventi';

  @override
  String get tituloProtectora => 'Protezione';

  @override
  String get subtituloNovedades => 'Novità';

  // --- Textos de FavoritosPage ---
  @override
  String get tituloFavoritos => 'Preferiti';

  // --- Textos de AnimalesPage ---
  @override
  String get tituloAnimales => 'Animali';

  // --- Textos de drawerPage ---
  @override
  String get noUsuarioLogeado => 'Nessun utente connesso';

  @override
  String get preferencias => 'Preferenze';

  @override
  String get drawerCatalogo => 'Catalogo';

  @override
  String get cerrarSesion => 'Disconnetti';

  // --- Textos de LoginPage ---
  @override
  String get mensajeError => 'Accesso fallito:';

  @override
  String get bienvenidoProtectora => 'Benvenuto a Protezione';

  @override
  String get usuarioContrasenya =>
      'Inserisci il tuo nome utente e la password per continuare.';

  @override
  String get contrasenya => 'Password';

  @override
  String get iniciarSesion => 'Accedi';

  // --- Textos de card de favoritos ---

  @override
  String get adoptar => 'Adotta';

  // --- Textos AnimalController ---

  @override
  String get animalCreado => 'Animale creato correttamente';

  @override
  String get animalActualizado => 'Animale aggiornato correttamente';

  @override
  String get confirmarEliminacion => 'Conferma eliminazione';

  @override
  String get preguntarConfirmarEliminacion => 'Sei sicuro di voler eliminare';

  @override
  String get cancelar => 'Annulla';

  @override
  String get eliminar => 'Elimina';

  @override
  String get animalEliminadoCorrectamente => 'Animale eliminato correttamente';

  // --- Texto MenuButons ---

  @override
  String get buttonProfolio => 'Profilo';

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
