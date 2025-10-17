import 'package:flutter/material.dart';
import 'package:proyecto_protectora/features/auth/presentation/pages/demostracion_page.dart';


class button_Paginademostracion extends StatelessWidget {
  final Widget? pantallaDestino;
  
  final dynamic texto;
  
  
  const button_Paginademostracion( {super.key, this.pantallaDestino, required this.texto});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () => Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (_) => pantallaDestino!)),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF9F7BFF),
          ),
          child: Text( texto, textDirection: TextDirection.ltr),
        ),
      ],
    );
  }
}


