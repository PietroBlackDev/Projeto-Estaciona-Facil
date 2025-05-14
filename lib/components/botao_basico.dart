import 'package:flutter/material.dart';

class BotaoBasico extends StatelessWidget {
  const BotaoBasico({super.key, required this.texto, required this.pagina});

  final String texto;
  final Widget pagina;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => pagina),
        );
      },
      child: Text(texto),
    );
  }
}
