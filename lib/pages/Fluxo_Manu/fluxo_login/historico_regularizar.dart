import 'package:dio/dio.dart';
import 'package:estaciona_facil/components/widget_label.dart';
import 'package:estaciona_facil/models/multas_model.dart';
import 'package:estaciona_facil/pages/Fluxo_Manu/fluxo_login/efetuar_login.dart';
import 'package:estaciona_facil/pages/Fluxo_Manu/fluxo_login/regularizar_aviso_dois.dart';
import 'package:estaciona_facil/pages/shared/loading.dart';
import 'package:flutter/material.dart';

class HistoricoRegularizar extends StatefulWidget {
  const HistoricoRegularizar({super.key});

  @override
  State<HistoricoRegularizar> createState() => _HistoricoRegularizarState();
}

class _HistoricoRegularizarState extends State<HistoricoRegularizar> {
  String idUsuario = box.read('id_usuario').toString();

  MultasModel? multasModel;

  void consultaMultas(String idUsuario) async {
    final token = box.read('token');

    try {
      Loading.show(context, mensagem: 'Consultando Multas...');

      String url =
          "http://10.125.121.135:8081/Projeto-Estaciona-Facil-API/multas/$idUsuario";

      Dio dio = Dio(
        BaseOptions(
          connectTimeout: const Duration(seconds: 20),
          receiveTimeout: const Duration(seconds: 30),
          validateStatus: (status) => status! < 500,
          headers: {"Authorization": "Bearer $token"},
        ),
      );

      final response = await dio.get(url);

      if (response.statusCode == 200) {
        multasModel = MultasModel.fromJson(response.data);

        setState(() {});
      }
    } catch (e) {
      print("Erro ao consultar multas: $e");
    } finally {
      Loading.hide();
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      consultaMultas(idUsuario);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              WidgetLabel(texto: 'Regularizar'),
              const SizedBox(height: 20),
              SizedBox(
                width: MediaQuery.of(context).size.width * 1,
                height: MediaQuery.of(context).size.height * 0.84,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        'Histórico de Regularização',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      (multasModel == null ||
                              multasModel!.multas == null ||
                              multasModel!.multas!.isEmpty)
                          ? Text("Nenhuma multa encontrada")
                          : ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: multasModel!.multas!.length,
                            itemBuilder: (context, index) {
                              final m = multasModel!.multas![index];

                              // Define cor do card conforme status
                              Color cardColor;
                              if (m.status?.toLowerCase() == "pago") {
                                cardColor = Colors.green.shade100;
                              } else if (m.status?.toLowerCase() ==
                                  "pendente") {
                                cardColor = Colors.blue.shade100;
                              } else {
                                cardColor = Colors.red.shade100;
                              }

                              return Column(
                                children: [
                                  Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder:
                                                (context) =>
                                                    RegularizarAvisoDois(
                                                      valor: m.valor,
                                                      placaCarro: m.placa,
                                                    ),
                                          ),
                                        );
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                          left: 21,
                                          top: 10,
                                          right: 21,
                                        ),
                                        child: Container(
                                          padding: const EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                            color: cardColor,
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color:
                                                    Theme.of(
                                                      context,
                                                    ).colorScheme.tertiary,
                                                blurRadius: 5,
                                                spreadRadius: 1,
                                              ),
                                            ],
                                          ),
                                          child: Column(
                                            spacing: 7,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              // CARRO
                                              Row(
                                                spacing: 5,
                                                children: [
                                                  Text(
                                                    'Carro:',
                                                    style:
                                                        Theme.of(
                                                          context,
                                                        ).textTheme.bodyMedium,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                          top: 3,
                                                        ),
                                                    child: Text(
                                                      m.nomeCarro ?? "Sem nome",
                                                      style:
                                                          Theme.of(
                                                            context,
                                                          ).textTheme.bodySmall,
                                                    ),
                                                  ),
                                                ],
                                              ),

                                              // PLACA
                                              Row(
                                                spacing: 5,
                                                children: [
                                                  Text(
                                                    'Placa:',
                                                    style:
                                                        Theme.of(
                                                          context,
                                                        ).textTheme.bodyMedium,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                          top: 3,
                                                        ),
                                                    child: Text(
                                                      m.placa?.toUpperCase() ??
                                                          "----",
                                                      style:
                                                          Theme.of(
                                                            context,
                                                          ).textTheme.bodySmall,
                                                    ),
                                                  ),
                                                ],
                                              ),

                                              // VALOR
                                              Row(
                                                spacing: 120,
                                                children: [
                                                  Row(
                                                    spacing: 5,
                                                    children: [
                                                      Text(
                                                        'Multa R\$:',
                                                        style:
                                                            Theme.of(context)
                                                                .textTheme
                                                                .bodyMedium,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets.only(
                                                              top: 3,
                                                            ),
                                                        child: Text(
                                                          m.valor.toString(),
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .bodySmall,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),

                                              // DATA
                                              Row(
                                                spacing: 54,
                                                children: [
                                                  Row(
                                                    spacing: 5,
                                                    children: [
                                                      Text(
                                                        'Data:',
                                                        style:
                                                            Theme.of(context)
                                                                .textTheme
                                                                .bodyMedium,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets.only(
                                                              top: 3,
                                                            ),
                                                        child: Text(
                                                          m.dtCriacao ?? "",
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .bodySmall,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),

                                              // STATUS
                                              Row(
                                                spacing: 120,
                                                children: [
                                                  Row(
                                                    spacing: 5,
                                                    children: [
                                                      Text(
                                                        'Status:',
                                                        style:
                                                            Theme.of(context)
                                                                .textTheme
                                                                .bodyMedium,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets.only(
                                                              top: 3,
                                                            ),
                                                        child: Text(
                                                          m.status ?? "",
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .bodySmall,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                ],
                              );
                            },
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
