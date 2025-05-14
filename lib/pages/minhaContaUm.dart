import 'package:flutter/material.dart';

class Minhacontaum extends StatefulWidget {
  const Minhacontaum({super.key});

  @override
  State<Minhacontaum> createState() => _MinhacontaumState();
}

class _MinhacontaumState extends State<Minhacontaum> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Meu Perfil'),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Voltar'),
            ),
          ],
        ),
      ),
    );
  }
}
