import 'package:estaciona_facil/components/botao_basico.dart';
import 'package:estaciona_facil/components/input.dart';
import 'package:estaciona_facil/pages/paginaum.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: Text(
          widget.title,
          style: TextStyle(color: Theme.of(context).colorScheme.onSecondary),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              BotaoBasico(texto: 'Começar', pagina: PaginaUm()),
              Text('Título 1', style: Theme.of(context).textTheme.titleLarge),
              Text('Título 2', style: Theme.of(context).textTheme.titleMedium),
              Text('Corpo', style: Theme.of(context).textTheme.bodyMedium),
              Input(visibilidade: false, label: 'Nome')
        
            ],
          ),
        ),
      ),
    );
  }
}
