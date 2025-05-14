import 'package:flutter/material.dart';

class BotaoBasicoPop extends StatelessWidget {
  const BotaoBasicoPop({super.key, required this.texto});

  final String texto;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.07,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pop;
        },
        child: Text(texto),
      ),
    );
  }
}
