import 'package:flutter/material.dart';

class BotaoInicio extends StatelessWidget {
  const BotaoInicio({
    super.key,
    this.pagina,
    required this.icone,
    required this.texto,
  });

  final Widget? pagina;
  final IconData icone;
  final String texto;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => pagina!),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.43,
        height: MediaQuery.of(context).size.height * 0.12,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onPrimary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icone),
            Text(texto, style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
