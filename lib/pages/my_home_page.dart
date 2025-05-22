import 'package:estaciona_facil/components/botao_basico.dart';
import 'package:estaciona_facil/components/input.dart';
import 'package:estaciona_facil/components/widget_label.dart';
import 'package:estaciona_facil/pages/Fluxo_Henrique/fluxo_pagamento/tela_estacionamento_um.dart';
import 'package:estaciona_facil/pages/Fluxo_Manu/fluxo_login/efetuar_login.dart';
import 'package:estaciona_facil/pages/Fluxo_Manu/fluxo_login/inicio.dart';
import 'package:estaciona_facil/pages/Fluxo_Manu/fluxo_recuperar.dart/recuperar_senha.dart';
import 'package:estaciona_facil/pages/Fluxo_Joao/cadastro_um.dart';
import 'package:estaciona_facil/pages/Fluxo_Pietro/adicionar_saldo_um.dart';
import 'package:estaciona_facil/pages/Fluxo_Pietro/minha_conta_um.dart';
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Column(
              spacing: 15,
              children: [
                Column(
                  children: [
                    Text(
                      'Fluxos por integrante',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2.0,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Text(
                            'Pietro',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          BotaoBasico(
                            texto: 'Meu Perfil',
                            pagina: Minhacontaum(),
                          ),
                          SizedBox(height: 10),
                          BotaoBasico(
                            texto: 'Adicionar Saldo',
                            pagina: AdicionarSaldoUm(),
                          ),
                          Text(
                            'João',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          BotaoBasico(texto: 'Cadastro', pagina: Cadastroum()),
                          Text(
                            'Manu',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          BotaoBasico(
                            texto: 'Recuperar Senha',
                            pagina: RecuperarSenha(),
                          ),
                          SizedBox(height: 10),
                          BotaoBasico(texto: 'Login', pagina: Inicio()),
                          Text(
                            'Henrique',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          BotaoBasico(
                            texto: 'Pagamento',
                            pagina: TelaEstacionamentoUm(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'Padrões dos componentes',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2.0,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        spacing: 10,
                        children: [
                          Text(
                            'Título 1',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          Text(
                            'Título 2',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text(
                            'Corpo',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          Input(visibilidade: false, label: 'Nome'),
                          WidgetLabel(texto: 'Minha Conta'),
                        ],
                      ),
                    ),
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
