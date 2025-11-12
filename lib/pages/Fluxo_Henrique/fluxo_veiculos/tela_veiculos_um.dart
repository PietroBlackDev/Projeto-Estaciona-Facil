import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:estaciona_facil/components/botao_basico.dart';
import 'package:estaciona_facil/components/widget_label.dart';
import 'package:estaciona_facil/pages/Fluxo_Manu/fluxo_login/efetuar_login.dart';
import 'package:estaciona_facil/models/veiculo_model.dart';
import 'package:estaciona_facil/pages/Fluxo_Henrique/fluxo_pagamento/tela_estacionamento_um.dart';
import 'package:estaciona_facil/pages/Fluxo_Henrique/fluxo_veiculos/tela_veiculos_dois.dart';
import 'package:estaciona_facil/pages/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class VeiculosUm extends StatefulWidget {
  const VeiculosUm({super.key});

  @override
  State<VeiculosUm> createState() => _VeiculosUmState();
}

class _VeiculosUmState extends State<VeiculosUm> {
  String idUsuario = box.read('id_usuario').toString();

  VeiculoModel? veiculoModel;
  List<VeiculoModel> listaVeiculos = [];

  Future deletaVeiculo(String? idVeiculo) async {
    final token = box.read('token');
    try {
      Loading.show(context, mensagem: 'Consultando Veículos...');

      String url =
          "http://10.0.0.94/Projeto-Estaciona-Facil-API/veiculos/${idVeiculo!}";

      Dio dio = Dio(
        BaseOptions(
          connectTimeout: const Duration(seconds: 20),
          receiveTimeout: const Duration(seconds: 30),
          validateStatus: (status) => status! < 500,
          headers: {"Authorization": "Bearer $token"},
        ),
      );

      final response = await dio.delete(url);

      if (response.statusCode == 202) {
        Loading.hide();
        setState(() {});
      }
    } catch (e) {
      print("Erro ao deletar veículo: $e");
    }
  }

  void consultaVeiculos() async {
    final token = box.read('token');

    try {
      Loading.show(context, mensagem: 'Consultando Veículos...');

      String url =
          "http://10.125.121.135:8081/Projeto-Estaciona-Facil-API/veiculos/$idUsuario";

      print(idUsuario);

      Dio dio = Dio(
        BaseOptions(
          connectTimeout: const Duration(seconds: 20),
          receiveTimeout: const Duration(seconds: 30),
          validateStatus: (status) => status! < 500,
          headers: {"Authorization": "Bearer $token"},
        ),
      );

      final response = await dio.get(url);

      var data = response.data;

      if (response.statusCode == 200) {
        if (data is String) {
          final jsonData = jsonDecode(data);
          final dataMap = jsonData as Map<String, dynamic>;

          print(dataMap);
        } else if (data is Map<String, dynamic>) {
          listaVeiculos =
              (data["usuario"] as List)
                  .map((item) => VeiculoModel.fromJson(item))
                  .toList();
          print(listaVeiculos);
          setState(() {});
        } else if (data is List) {
          print('API retornou como List');
        }
        Loading.hide();
        setState(() {});
      }
    } catch (e) {
      print("Erro ao consultar veículos: $e");
    } finally {
      Loading.hide();
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      consultaVeiculos();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 60.0),
          child: Column(
            spacing: 20,
            children: [
              const WidgetLabel(texto: "Meus Veículos"),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    spacing: 20,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: MediaQuery.of(context).size.height * 0.65,
                        padding: EdgeInsets.only(top: 20),
                        decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(
                              color: Theme.of(context).colorScheme.secondary,
                              width: 5,
                            ),
                          ),
                        ),
                        child: Column(
                          spacing: 30,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            (listaVeiculos.isEmpty)
                                ? Text("Nenhum veiculo cadastrado!")
                                : ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: listaVeiculos.length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      width:
                                          MediaQuery.of(context).size.width *
                                          0.9,
                                      padding: EdgeInsets.symmetric(
                                        vertical: 10,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            width:
                                                MediaQuery.of(
                                                  context,
                                                ).size.width *
                                                0.65,
                                            padding: EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Color(0xff540F63),
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  spacing: 20,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                            left: 15.0,
                                                          ),
                                                      child: Column(
                                                        spacing: 15,
                                                        children: [
                                                          Text(
                                                            listaVeiculos[index]
                                                                .nomeCarro!,
                                                            style: TextStyle(
                                                              fontSize: 15,
                                                            ),
                                                          ),
                                                          Text(
                                                            listaVeiculos[index]
                                                                .placa!,
                                                            style: TextStyle(
                                                              fontSize: 15,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Column(
                                                      children: [
                                                        Container(
                                                          height:
                                                              MediaQuery.of(
                                                                context,
                                                              ).size.height *
                                                              0.08,
                                                          width:
                                                              MediaQuery.of(
                                                                context,
                                                              ).size.width *
                                                              0.26,
                                                          decoration: BoxDecoration(
                                                            color: Color(
                                                              0xff540F63,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                  5,
                                                                ),
                                                          ),
                                                          child: TextButton(
                                                            onPressed: () {
                                                              box.write(
                                                                'descricao',
                                                                listaVeiculos[index]
                                                                    .nomeCarro!,
                                                              );
                                                              box.write(
                                                                'placa_veiculo',
                                                                listaVeiculos[index]
                                                                    .placa!,
                                                              );
                                                              Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                  builder:
                                                                      (
                                                                        context,
                                                                      ) =>
                                                                          TelaEstacionamentoUm(),
                                                                ),
                                                              );
                                                            },
                                                            child: Text(
                                                              "Estacionar",
                                                              style: TextStyle(
                                                                fontSize: 16,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          Column(
                                            children: [
                                              ElevatedButton(
                                                onPressed: () {
                                                  deletaVeiculo(
                                                    listaVeiculos[index].id!
                                                        .toString(),
                                                  );
                                                  listaVeiculos.removeAt(index);
                                                  showDialog(
                                                    context: context,
                                                    builder: (context) {
                                                      return AlertDialog(
                                                        backgroundColor:
                                                            Colors.white,
                                                        title: Center(
                                                          child: Text(
                                                            'Veículo excluído com\nsucesso!',
                                                          ),
                                                        ),
                                                        content: Lottie.asset(
                                                          'assets/lottie/confirmado.json',
                                                        ),
                                                        actions: [
                                                          Container(
                                                            width:
                                                                MediaQuery.of(
                                                                  context,
                                                                ).size.width *
                                                                0.9,
                                                            height:
                                                                MediaQuery.of(
                                                                  context,
                                                                ).size.height *
                                                                0.05,
                                                            decoration:
                                                                BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius.circular(
                                                                        0,
                                                                      ),
                                                                ),
                                                            child: ElevatedButton(
                                                              style: ElevatedButton.styleFrom(
                                                                shape: RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius.circular(
                                                                        10,
                                                                      ),
                                                                ),
                                                              ),
                                                              onPressed: () {
                                                                Navigator.of(
                                                                  context,
                                                                ).pop();
                                                              },
                                                              child: Text(
                                                                "OK",
                                                                style: TextStyle(
                                                                  color:
                                                                      const Color.fromARGB(
                                                                        255,
                                                                        255,
                                                                        255,
                                                                        255,
                                                                      ),
                                                                  fontSize: 18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  );
                                                },
                                                child: SizedBox(
                                                  width:
                                                      MediaQuery.of(
                                                        context,
                                                      ).size.width *
                                                      0.1,
                                                  height:
                                                      MediaQuery.of(
                                                        context,
                                                      ).size.height *
                                                      0.09,

                                                  child: Icon(
                                                    Icons.delete,
                                                    color: Colors.white,
                                                    size: 45,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                          ],
                        ),
                      ),

                      BotaoBasico(
                        texto: "Cadastrar Novo Veículo",
                        pagina: VeiculosDois(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
