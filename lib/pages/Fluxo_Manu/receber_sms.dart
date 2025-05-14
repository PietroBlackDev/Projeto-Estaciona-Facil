import 'package:estaciona_facil/components/botao_basico.dart';
import 'package:estaciona_facil/components/input.dart';
import 'package:flutter/material.dart';

class ReceberSms extends StatefulWidget {
  const ReceberSms({super.key});

  @override
  State<ReceberSms> createState() => _ReceberSmsState();
}

class _ReceberSmsState extends State<ReceberSms> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            spacing: 20,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Recuperação de Senha - SMS', style: Theme.of(context).textTheme.titleLarge,),
              Column(
                spacing: 10,
                children: [
                  Input(visibilidade: false, label: 'Informe seu celular cadastrado:'),
                  BotaoBasico(texto: 'Receber SMS', pagina: ReceberSms()),
                  // inserir botão de cancelar
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}