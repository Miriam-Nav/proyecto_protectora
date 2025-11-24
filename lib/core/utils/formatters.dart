import 'package:intl/intl.dart';

// Función que recibe un objeto DateTime y lo devuelve
String formatSampleDate(DateTime date) => DateFormat.yMMMd().format(date);

// Función que recibe un número y lo devuelve
String formatSampleCurrency(num amount) =>
    NumberFormat.simpleCurrency(name: 'EUR').format(amount);
