import 'package:equatable/equatable.dart';

class Noticia extends Equatable {
  final int idNoticia;
  final String titulo;
  final String texto;
  final String imagen;

  const Noticia({
    required this.idNoticia,
    required this.titulo,
    required this.texto,
    required this.imagen,
  });

  factory Noticia.fromJson(Map<String, dynamic> json) => Noticia(
    idNoticia: json['idNoticia'] as int,
    titulo: json['titulo'] as String,
    texto: json['texto'] as String,
    imagen: json['imagen'] as String,
  );

  @override
  List<Object?> get props => [idNoticia];
}
