import 'package:estaciona_facil/components/botao_basico.dart';
import 'package:estaciona_facil/pages/Fluxo_Manu/fluxo_recuperar.dart/receber_email.dart';
import 'package:estaciona_facil/pages/Fluxo_Manu/fluxo_recuperar.dart/receber_sms.dart';
import 'package:estaciona_facil/pages/Fluxo_Manu/widgets/botao_voltar.dart';
import 'package:flutter/material.dart';

class RecuperarSenha extends StatefulWidget {
  const RecuperarSenha({super.key});

  @override
  State<RecuperarSenha> createState() => _RecuperarSenhaState();
}

class _RecuperarSenhaState extends State<RecuperarSenha> {
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
              Text('Recuperação de Senha', style: Theme.of(context).textTheme.titleLarge,),
              Column(
                spacing: 20,
                children: [
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text('Escolha como deseja recuperar sua senha:', style: Theme.of(context).textTheme.bodyMedium,)),
                  BotaoBasico(texto: 'Receber SMS', pagina: ReceberSms()),
                  BotaoBasico(texto: 'Receber E-MAIL', pagina: ReceberEmail()),
                  BotaoVoltar(texto: 'Cancelar')
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
