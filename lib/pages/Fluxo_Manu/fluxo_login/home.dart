import 'package:dio/dio.dart';
import 'package:estaciona_facil/models/usuario_model.dart';
import 'package:estaciona_facil/pages/Fluxo_Henrique/fluxo_pagamento/tela_estacionamento_um.dart';
import 'package:estaciona_facil/pages/Fluxo_Henrique/fluxo_veiculos/tela_veiculos_um.dart';
import 'package:estaciona_facil/pages/Fluxo_Manu/fluxo_login/efetuar_login.dart';
import 'package:estaciona_facil/pages/Fluxo_Manu/fluxo_login/historico_regularizar.dart';
import 'package:estaciona_facil/pages/Fluxo_Manu/fluxo_login/inicio.dart';
import 'package:estaciona_facil/pages/Fluxo_Manu/widgets/appbar.dart';
import 'package:estaciona_facil/pages/Fluxo_Manu/widgets/botao_inicio.dart';
import 'package:estaciona_facil/pages/Fluxo_Manu/widgets/container_valores.dart';
import 'package:estaciona_facil/pages/Fluxo_Pietro/adicionar_saldo_um.dart';
import 'package:estaciona_facil/pages/Fluxo_Pietro/ajuda.dart';
import 'package:estaciona_facil/pages/Fluxo_Pietro/alarmes.dart';
import 'package:estaciona_facil/pages/Fluxo_Pietro/historico.dart';
import 'package:estaciona_facil/pages/Fluxo_Pietro/minha_conta_um.dart';
import 'package:estaciona_facil/pages/Fluxo_Pietro/termos_condicoes.dart';
import 'package:estaciona_facil/pages/shared/loading.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String idUsuario = box.read('id_usuario');

  UsuarioModel? usuario;

  void consultaUsuario(String idUsuario) async {
    final token = box.read('token');
    try {
      Loading.show(context, mensagem: 'Carregando dados...');

      String url =
          "http://192.168.68.121/Projeto-Estaciona-Facil-API/usuarios/$idUsuario";

      Dio dio = Dio(
        BaseOptions(
          connectTimeout: const Duration(seconds: 20),
          receiveTimeout: const Duration(seconds: 30),
          validateStatus: (status) => status! < 500,
          headers: {
            "Authorization": "Bearer $token",  
          },
        ),
      );

      final response = await dio.get(url);

      if (response.statusCode == 200) {
        usuario = UsuarioModel.fromJson(response.data['Usuário']);
        setState(() {});

        box.write('id', usuario!.id);
        box.write('nome', usuario!.nome);
        box.write('email', usuario!.email);
        box.write('telefone', usuario!.telefone);
        box.write('cpf', usuario!.cPF);
        box.write('forma_pagamento', usuario!.formaPagamento);
        box.write('saldo', usuario!.saldo);

      }

    Loading.hide();
  } catch (e) {
    Loading.hide();
    print("Erro ao consultar usuário: $e");
  }
}
  
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      consultaUsuario(idUsuario);
    });
  }

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
                        Text('Olá, ${usuario?.nome ?? ''}', style: TextStyle(fontSize: 30)),
                        Text(
                          '',
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
                        ContainerValores(nome: 'Saldo', valor: usuario?.saldo ?? '0'),
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
                              pagina: TelaEstacionamentoUm(),
                            ),
                            BotaoInicio(
                              icone: Icons.directions_car,
                              texto: 'Veículos',
                              pagina: VeiculosUm(),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: 10,
                          children: [
                            BotaoInicio(
                              icone: Icons.person,
                              texto: 'Perfil',
                              pagina: Minhacontaum(),
                            ),
                            BotaoInicio(
                              icone: Icons.account_balance_wallet,
                              texto: 'Saldo',
                              pagina: AdicionarSaldoUm(),
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
                              pagina: Historico(),
                            ),
                            BotaoInicio(
                              icone: Icons.notifications_active,
                              texto: 'Alarmes',
                              pagina: Alarmes(),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: 10,
                          children: [
                            BotaoInicio(
                              icone: Icons.help,
                              texto: 'Ajuda',
                              pagina: Ajuda(),
                            ),
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
                              pagina: TermosCondicoes(),
                            ),
                            BotaoInicio(
                              icone: Icons.logout,
                              texto: 'Sair',
                              pagina: Inicio(),
                            ),
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
