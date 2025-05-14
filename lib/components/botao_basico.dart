import 'package:flutter/material.dart';

class BotaoBasico extends StatelessWidget {
  const BotaoBasico({super.key, required this.texto, required this.pagina});

  final String texto;
  final Widget pagina;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.07,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => pagina),
          );
        },
        child: Text(texto),
      ),
    );
  }
}
