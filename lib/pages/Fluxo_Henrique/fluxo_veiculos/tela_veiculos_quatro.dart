import 'package:estaciona_facil/components/botao_basico.dart';
import 'package:estaciona_facil/components/input.dart';
import 'package:estaciona_facil/components/widget_label.dart';
import 'package:estaciona_facil/pages/Fluxo_Henrique/fluxo_veiculos/tela_veiculos_cinco.dart';
import 'package:estaciona_facil/pages/Fluxo_Henrique/fluxo_veiculos/tela_veiculos_dois.dart';
import 'package:flutter/material.dart';

class VeiculosQuatro extends StatefulWidget {
  const VeiculosQuatro({super.key, required this.caminhoImagem});

  final String caminhoImagem;

  @override
  State<VeiculosQuatro> createState() => _VeiculosQuatroState();
}

class _VeiculosQuatroState extends State<VeiculosQuatro> {
  final String placa = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 60.0),
            child: Column(
              spacing: 20,
              children: [
                WidgetLabel(texto: "Novo Veículo"),
                Column(
                  spacing: 30,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.52,
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
                        children: [
                          Column(
                            spacing: 20,
                            children: [
                              Text(
                                "1. Categoria do veículo: ",
                                style: Theme.of(context).textTheme.titleMedium,
                                textAlign: TextAlign.left,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                spacing: 40,
                                children: [
                                  Icon(
                                    Icons.directions_car,
                                    size: 50,
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => VeiculosDois(),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      "ALTERAR",
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),

                          Column(
                            spacing: 20,
                            children: [
                              Text(
                                "2. Padrão da placa: ",
                                style: Theme.of(context).textTheme.titleMedium,
                                textAlign: TextAlign.left,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                spacing: 40,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    spacing: 10,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                            0.2,
                                        height:
                                            MediaQuery.of(context).size.height *
                                            0.05,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.black,
                                          ),
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "ABC 1A34",
                                              style:
                                                  Theme.of(
                                                    context,
                                                  ).textTheme.bodySmall,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Text(
                                        "Mercosul",
                                        style:
                                            Theme.of(
                                              context,
                                            ).textTheme.bodyMedium,
                                      ),
                                    ],
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      "ALTERAR",
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),

                          Column(
                            children: [
                              Text(
                                "3. Qual a placa do veículo?",
                                style: Theme.of(context).textTheme.titleMedium,
                                textAlign: TextAlign.left,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.8,
                                height:
                                    MediaQuery.of(context).size.height * 0.13,
                                child: Input(visibilidade: false, label: placa),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    BotaoBasico(texto: "Avançar", pagina: VeiculosCinco()),

                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: MediaQuery.of(context).size.height * 0.222,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/Logo.png',
                            width: 120,
                            height: 120,
                          ),
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
