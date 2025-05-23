import 'package:estaciona_facil/components/botao_basico.dart';
import 'package:estaciona_facil/components/widget_label.dart';
import 'package:estaciona_facil/pages/Fluxo_Henrique/fluxo_pagamento/pagamento_dois.dart';
import 'package:flutter/material.dart';
import 'package:flutter_check_box_rounded/flutter_check_box_rounded.dart';

class PagamentoUm extends StatefulWidget {
  const PagamentoUm({super.key, required this.placa});

  final String placa;

  @override
  State<PagamentoUm> createState() => _PagamentoUmState();
}

class _PagamentoUmState extends State<PagamentoUm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 60.0),
            child: Column(
              spacing: 20,
              children: [
                WidgetLabel(texto: "Confirmação"),
                Center(
                  child: Column(
                    spacing: 20,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Descrição do carro ABC 1A34",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        spacing: 20,
                        children: [
                          Row(
                            spacing: 10,
                            children: [
                              Icon(
                                Icons.access_time_filled,
                                color: Colors.deepPurple,
                                size: 40,
                              ),
                              Text(
                                "Hora(s) Selecionada",
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
            
                          Row(
                            spacing: 10,
                            children: [
                              Icon(
                                Icons.attach_money,
                                color: Colors.deepPurple,
                                size: 40,
                              ),
                              Text(
                                "Valor",
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.2,
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(color: Colors.deepPurple, width: 2),
                    ),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 20,
                      children: [
                        Text(
                          "Escolha uma forma de pagamento",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: 20,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.22,
                              height: MediaQuery.of(context).size.height * 0.1,
                              decoration: BoxDecoration(
                                color: Color(0xff540F63),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                spacing: 5,
                                children: [
                                  Icon(
                                    Icons.payments,
                                    color: Colors.white,
                                    size: 42,
                                  ),
                                  Text(
                                    "PIX",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.22,
                              height: MediaQuery.of(context).size.height * 0.1,
                              decoration: BoxDecoration(
                                color: Color(0xff540F63),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                spacing: 5,
                                children: [
                                  Icon(
                                    Icons.payment,
                                    color: Colors.white,
                                    size: 42,
                                  ),
                                  Text(
                                    "Cartão",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.22,
                              height: MediaQuery.of(context).size.height * 0.1,
                              decoration: BoxDecoration(
                                color: Color(0xff540F63),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                spacing: 5,
                                children: [
                                  Icon(Icons.paypal, color: Colors.white, size: 42),
                                  Text(
                                    "Boleto",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
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
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.3,
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(color: Colors.deepPurple, width: 2),
                    ),
                  ),
                  child: Center(
                    child: Column(
                      spacing: 90,
                      children: [
                        // Row(
                        //   children: [
                        //     Input(
                        //       visibilidade: false,
                        //       label: 'Informe seu celular cadastrado:',
                        //     ),
                        //   ],
                        // ),
                        // Row(
                        //   children: [
                        //     Input(
                        //       visibilidade: false,
                        //       label: "Número crédito do cartão: ",
                        //     ),
                        //   ],
                        // ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   children: [
                        //     Input(visibilidade: false, label: "Validade(mm/aa):"),
                        //     Input(visibilidade: false, label: "CVV: "),
                        //   ],
                        // ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Row(
                    children: [
                      CheckBoxRounded(onTap: (bool? value) {}),
                      Text("Salvar cartão"),
                    ],
                  ),
                ),
                BotaoBasico(
                  texto: "Avançar",
                  pagina: PagamentoDois(placa: "ABC 1A34"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
