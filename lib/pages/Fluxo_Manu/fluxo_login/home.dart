import 'package:estaciona_facil/pages/Fluxo_Manu/fluxo_login/historico_regularizar.dart';
import 'package:estaciona_facil/pages/Fluxo_Manu/widgets/appbar.dart';
import 'package:estaciona_facil/pages/Fluxo_Manu/widgets/botao_inicio.dart';
import 'package:estaciona_facil/pages/Fluxo_Manu/widgets/container_valores.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
        child: Column(
          spacing: 20,
          children: [
            AppbarHome(texto: 'Início'),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Olá, ', style: TextStyle(fontSize: 30)),
                        Text(
                          'Nome do Usuário',
                          style: TextStyle(
                            fontSize: 30,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'assets/images/Logo.png',
                          width: 90,
                          height: 90,
                        ),
                        ContainerValores(nome: 'Saldo', valor: '0'),
                      ],
                    ),
                    Divider(thickness: 2),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 10,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: 10,
                          children: [
                            BotaoInicio(
                              icone: Icons.local_parking,
                              texto: 'Estacionar',
                            ),
                            BotaoInicio(
                              icone: Icons.directions_car,
                              texto: 'Veículos',
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: 10,
                          children: [
                            BotaoInicio(icone: Icons.person, texto: 'Perfil'),
                            BotaoInicio(
                              icone: Icons.account_balance_wallet,
                              texto: 'Saldo',
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: 10,
                          children: [
                            BotaoInicio(
                              icone: Icons.history,
                              texto: 'Histórico',
                            ),
                            BotaoInicio(
                              icone: Icons.notifications_active,
                              texto: 'Alarmes',
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: 10,
                          children: [
                            BotaoInicio(icone: Icons.help, texto: 'Ajuda'),
                            BotaoInicio(
                              icone: Icons.build,
                              texto: 'Regularizar',
                              pagina: HistoricoRegularizar(),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: 10,
                          children: [
                            BotaoInicio(
                              icone: Icons.description,
                              texto: 'Termos',
                            ),
                            BotaoInicio(icone: Icons.logout, texto: 'Sair'),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
