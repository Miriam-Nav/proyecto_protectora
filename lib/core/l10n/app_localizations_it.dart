// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  // --- Testi generali ---
  @override
  String get appTitle => 'Zampette Felici';

  @override
  String hello(String name) {
    return 'Ciao, $name!';
  }

  @override
  String get conocer => 'Conosci';

  @override
  String get inicio => 'Inizio';

  @override
  String get invitado => 'Ospite';

  @override
  String get sinCorreo => 'Nessuna email';

  String get noLoggin => 'Nessun utente connesso';

  @override
  String get guardado => 'Salvato';

  @override
  String get idioma => 'Lingua';

  @override
  String get selecIdioma => 'Cambia Lingua';

  @override
  String get apariencia => "Aspetto";

  @override
  String get modoOsc => "Modalità Scura";

  @override
  String get namePagesGestion => 'Gestione Pagine';

  @override
  String get pagCatalogo => 'Pagina Catalogo';

  @override
  String get si => 'Sì';

  @override
  String get no => 'No';

  // --- Testi DrawerPage ---
  @override
  String get preferencias => 'Preferenze';

  @override
  String get catalogo => 'Catalogo';

  @override
  String get cerrarSesion => 'Disconnetti';

  // --- Dati Utente ---
  @override
  String get datosUsuario => 'Dati Utente';

  @override
  String get usuario => 'Utente';

  @override
  String get fechaNacimiento => 'Data di Nascita';

  @override
  String get nombreAdoptante => 'Nome dell’Adottante';

  @override
  String get apellido1 => 'Primo Cognome';

  @override
  String get apellido2 => 'Secondo Cognome';

  @override
  String get dni => 'Documento';

  @override
  String get telefono => 'Telefono';

  @override
  String get correo => 'Email';

  @override
  String get direccion => 'Indirizzo';

  @override
  String get cp => 'CAP';

  @override
  String get localidad => 'Località';

  @override
  String get provincia => 'Provincia';

  // --- Dati Animali ---

  @override
  String get filtrarPor => "Filtra per";

  @override
  String get limpiarFiltro => "Pulisci filtro";

  @override
  String get nombre => 'Nome';

  @override
  String get chipAnimal => 'Chip';

  @override
  String get sexoAnimal => 'Sesso';

  @override
  String get macho => 'Maschio';

  @override
  String get hembra => 'Femmina';

  @override
  String get razaAnimal => 'Razza';

  @override
  String get tipoAnimal => 'Tipo';

  @override
  String get perro => 'Cane';

  @override
  String get gato => 'Gatto';

  @override
  String get otro => 'Altro';

  @override
  String get esterelizadoAnimal => 'Sterilizzato';

  @override
  String get fotoAnimal => 'Foto';

  @override
  String get descripcionAnimal => 'Descrizione Breve';

  // --- Bottoni ---
  @override
  String get botonAciones => 'Gestisci Animali';

  @override
  String get enviarSolicitud => 'Invia Richiesta';

  @override
  String get adoptar => 'Adotta';

  @override
  String get buttonProfile => 'Profilo';

  // --- HomePage ---
  @override
  String get totalAdop => 'Totale Richieste di Adozione';

  @override
  String get revisarAdop => 'Adozioni da Revisionare:';

  @override
  String get visitaVeterinario => 'Visita Veterinaria';

  @override
  String get acciones => 'Azioni';

  @override
  String get actividadReciente => 'Attività Recente';

  @override
  String get sinActividadReciente => 'Nessuna adozione registrata finora.';

  @override
  String get solicitudAdopcion => '- Richiesta di Adozione';

  @override
  String get adopcion => 'Adozione';

  // --- Formulario Adozione ---
  @override
  String get avisoSolicitudGuardada => 'Richiesta salvata correttamente';

  @override
  String get solicitudCreada => 'Richiesta di adozione creata correttamente';

  @override
  String get preguntEliAdop => 'Sei sicuro di voler eliminare questa adozione?';

  @override
  String get solicitudEliminada => 'Adozione eliminata correttamente';

  @override
  String get noAnimalSelect => 'Nessun animale selezionato';

  @override
  String get tituloFormulario => 'Modulo di Adozione';

  @override
  String get chipDuplicado => 'Esiste già un animale con questo chip';

  @override
  String get animalNoEncontrado => 'Animale non trovato';

  @override
  String get nombreObligatorio => 'Il Nome è obbligatorio';

  @override
  String get obligatorioApellido1 => 'Il Primo Cognome è obbligatorio';

  @override
  String get obligatorioApellido2 => 'Il Secondo Cognome è obbligatorio';

  @override
  String get obligatorioDni => 'Il Documento è obbligatorio';

  @override
  String get formatoDni => 'Formato Documento non valido (12345678A)';

  @override
  String get obligatorioTelefono => 'Il Telefono è obbligatorio';

  @override
  String get formatoNum => 'Si aspettava un valore numerico';

  @override
  String get obligatorioCorreo => 'L’Email è obbligatoria';

  @override
  String get formatoCorreo => 'Formato email non valido';

  @override
  String get obligatorioDireccion => 'L’Indirizzo è obbligatorio';

  @override
  String get obligatorioCp => 'Il CAP è obbligatorio';

  @override
  String get obligLocalidad => 'La Località è obbligatoria';

  @override
  String get obligProvincia => 'La Provincia è obbligatoria';

  // --- CRUDAnimalPage ---
  @override
  String get gestionarAnimales => 'Gestisci Animali';

  @override
  String get noAnimalesRegistrados => 'Nessun animale registrato';

  @override
  String get selecEdicion => 'Seleziona un animale da modificare';

  @override
  String get selecSexo => 'Seleziona sesso';

  @override
  String get razaOblig => 'Razza obbligatoria';

  @override
  String get tipoOblig => 'Seleziona tipo';

  @override
  String get fechaOblig => 'Data obbligatoria';

  @override
  String get fotoOblig => 'Foto obbligatoria';

  @override
  String get descOblig => 'Descrizione obbligatoria';

  @override
  String get descLong => 'La descrizione non può superare i 50 caratteri';

  @override
  String get crearAnimal => 'Crea';

  @override
  String get guardarCambios => 'Salva';

  // --- ClientPage ---
  @override
  String get noticiasEventos => 'Notizie ed Eventi';

  @override
  String get noNoticias => 'Nessuna notizia al momento.';

  @override
  String get novedades => 'Novità';

  @override
  String get favoritos => 'Preferiti';

  @override
  String get noNoFavoritos => 'Non hai ancora animali preferiti.';

  @override
  String get animales => 'Animali';

  @override
  String get noAnimales => 'Nessun animale disponibile al momento.';

  // --- LoginPage ---
  @override
  String get errorSesion => 'Accesso fallito:';

  @override
  String get bienvenida => 'Benvenuto a';

  @override
  String get usuarioContrasenya =>
      'Inserisci il tuo utente e la password per continuare.';

  @override
  String get contrasenya => 'Password';

  @override
  String get iniciarSesion => 'Accedi';

  // --- AnimalController ---
  @override
  String get animalCreado => 'Animale creato correttamente';

  @override
  String get animalActualizado => 'Animale aggiornato correttamente';

  @override
  String get confirmarEliminacion => 'Conferma eliminazione';

  @override
  String preguntaEliminacion(String name) {
    return 'Sei sicuro di voler eliminare $name?';
  }

  @override
  String get cancelar => 'Annulla';

  @override
  String get eliminar => 'Elimina';

  @override
  String get animalEliminado => 'Animale eliminato correttamente';
}
