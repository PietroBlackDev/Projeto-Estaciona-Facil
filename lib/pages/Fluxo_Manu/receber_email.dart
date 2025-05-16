import 'package:estaciona_facil/components/input.dart';
import 'package:estaciona_facil/pages/Fluxo_Manu/widgets/botao_voltar.dart';
import 'package:estaciona_facil/pages/Fluxo_Manu/widgets/modal_recupera.dart';
import 'package:flutter/material.dart';

class ReceberEmail extends StatefulWidget {
  const ReceberEmail({super.key});

  @override
  State<ReceberEmail> createState() => _ReceberEmailState();
}

class _ReceberEmailState extends State<ReceberEmail> {
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
              Text('Recuperação de Senha - Email', style: Theme.of(context).textTheme.titleLarge,),
              Column(
                spacing: 10,
                children: [
                  Input(visibilidade: false, label: 'Informe seu email cadastrado:'),
                  BotaoModal(textoBotao: 'Receber EMAIL', titulo: 'Email enviado para o endereço informado', texto: 'Caso o Email não chegue, verifique se inseriu o endereço corretamente.', textoBotaoModal: 'Voltar',),
                  BotaoVoltar(texto: 'Voltar')
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