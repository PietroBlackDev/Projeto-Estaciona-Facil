import 'package:estaciona_facil/components/botao_basico.dart';
import 'package:estaciona_facil/components/widget_label.dart';
import 'package:estaciona_facil/pages/Fluxo_Henrique/fluxo_pagamento/pagamento_um.dart';
import 'package:estaciona_facil/pages/Fluxo_Henrique/fluxo_veiculos/tela_veiculos_um.dart';
import 'package:estaciona_facil/pages/Fluxo_Manu/fluxo_login/efetuar_login.dart';
import 'package:flutter/material.dart';

class TelaEstacionamentoDois extends StatefulWidget {
  const TelaEstacionamentoDois({super.key, required this.saldo});

  final double saldo;

  @override
  State<TelaEstacionamentoDois> createState() => _TelaEstacionamentoDoisState();
}

class _TelaEstacionamentoDoisState extends State<TelaEstacionamentoDois> {
  String groupValue = 'Yes';
  String groupValueDois = 'Yes';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            spacing: 30,
            children: [
              const WidgetLabel(texto: "Estacionar Agora"),
              Expanded(
                child: SingleChildScrollView(
                  child: SizedBox(
                    child: Column(
                      spacing: 30,
                      children: [
                        BotaoBasico(
                          texto: "Saldo: ${box.read('saldo').toString()}",
                        ),
                        Text(
                          "Selecione a placa do veículo",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 23,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Arsenal',
                          ),
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
                                box.read('placa_veiculo'),
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
                          height: MediaQuery.of(context).size.height * 0.28,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
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
                                          value: "1 hora",
                                          activeColor:
                                              Theme.of(
                                                context,
                                              ).colorScheme.secondary,
                                          groupValue: groupValue,
                                          onChanged: (value) {
                                            setState(() {
                                              groupValue = value!;
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
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
                                          value: "2 horas",
                                          activeColor:
                                              Theme.of(
                                                context,
                                              ).colorScheme.secondary,
                                          groupValue: groupValue,
                                          onChanged: (value) {
                                            setState(() {
                                              groupValue = value!;
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
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
                                          value: "3 horas",
                                          activeColor:
                                              Theme.of(
                                                context,
                                              ).colorScheme.secondary,
                                          groupValue: groupValue,
                                          onChanged: (value) {
                                            setState(() {
                                              groupValue = value!;
                                            });
                                          },
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
                          pagina: PagamentoUm(
                            placa: "ABC 1A34",
                            saldo: widget.saldo,
                            horas: groupValue,
                          ),
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
            ],
          ),
        ),
      ),
    );
  }
}
