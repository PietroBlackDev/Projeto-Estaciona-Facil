import 'package:estaciona_facil/components/input.dart';
import 'package:estaciona_facil/pages/Fluxo_Manu/widgets/botao_voltar.dart';
import 'package:estaciona_facil/pages/Fluxo_Manu/widgets/modal_recupera.dart';
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
          child: SingleChildScrollView(
            child: Column(
              spacing: 20,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Recuperação de Senha - SMS',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Column(
                  spacing: 20,
                  children: [
                    Input(
                      visibilidade: false,
                      label: 'Informe seu celular cadastrado:',
                    ),
                    BotaoModal(
                      textoBotao: 'Receber SMS',
                      titulo: 'SMS enviado para o número informado',
                      texto:
                          'Caso o SMS não chegue, verifique se inseriu o número corretamente.',
                      textoBotaoModal: 'Voltar',
                    ),
                    BotaoVoltar(texto: 'Voltar'),
                    // inserir botão de cancelar
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
