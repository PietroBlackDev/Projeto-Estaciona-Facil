import 'package:estaciona_facil/components/botao_basico.dart';
import 'package:estaciona_facil/components/widget_label.dart';
import 'package:estaciona_facil/pages/Fluxo_Henrique/fluxo_pagamento/pagamento_um.dart';
import 'package:estaciona_facil/pages/Fluxo_Henrique/fluxo_veiculos/tela_veiculos_um.dart';
import 'package:flutter/material.dart';
import 'package:flutter_check_box_rounded/flutter_check_box_rounded.dart';

class TelaEstacionamentoDois extends StatefulWidget {
  const TelaEstacionamentoDois({super.key, required this.saldo});

  final double saldo;

  @override
  State<TelaEstacionamentoDois> createState() => _TelaEstacionamentoDoisState();
}

class _TelaEstacionamentoDoisState extends State<TelaEstacionamentoDois> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 60.0),
            child: Column(
              spacing: 30,
              children: [
                WidgetLabel(texto: "Estacionar Agora"),
                BotaoBasico(texto: "Saldo: ${widget.saldo.toString()}"),
                Text(
                  "Selecione a placa do veículo",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.18,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Descrição do Carro",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(
                        "ABC 1A34",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 65,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Arsenal',
                        ),
                      ),
                    ],
                  ),
                ),
                BotaoBasico(texto: "Trocar", pagina: VeiculosUm()),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: Column(
                    spacing: 10,
                    children: [
                      Text(
                        "Selecione o tempo de estacionamento:",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Arsenal',
                        ),
                      ),
                      Text(
                        "MÁXIMA PERMANÊNCIA",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      SizedBox(
                        child: Column(
                          spacing: 10,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "1 Hora",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Arsenal',
                                  ),
                                ),
                                Radio(
                                  value: "3 Horas",
                                  groupValue: "Horas",
                                  onChanged: (value) {},
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "2 Horas",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Arsenal',
                                  ),
                                ),
                                Radio(
                                  value: "3 Horas",
                                  groupValue: "Horas",
                                  onChanged: (value) {},
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "3 Horas",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Arsenal',
                                  ),
                                ),
                                Radio(
                                  value: "3 Horas",
                                  groupValue: "Horas",
                                  onChanged: (value) {},
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                BotaoBasico(
                  texto: "Avançar",
                  pagina: PagamentoUm(placa: "ABC 1A34", saldo: widget.saldo),
                ),
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
          ),
        ),
      ),
    );
  }
}
