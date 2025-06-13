import 'package:estaciona_facil/components/botao_basico.dart';
import 'package:estaciona_facil/components/widget_label.dart';
import 'package:estaciona_facil/pages/Fluxo_Henrique/fluxo_pagamento/tela_estacionamento_um.dart';
import 'package:estaciona_facil/pages/Fluxo_Henrique/fluxo_veiculos/tela_veiculos_dois.dart';
import 'package:flutter/material.dart';

class VeiculosUm extends StatefulWidget {
  const VeiculosUm({super.key});

  @override
  State<VeiculosUm> createState() => _VeiculosUmState();
}

class _VeiculosUmState extends State<VeiculosUm> {
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
                  child: SizedBox(
                    child: Column(
                      spacing: 20,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
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
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.9,
                                child: Text(
                                  "A placa com a estrela dourada será automaticamente carregada quando você for estacionar.",
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Color(0xff540F63),
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          spacing: 10,
                                          children: [
                                            Column(
                                              children: [
                                                Row(
                                                  spacing: 5,
                                                  children: [
                                                    Icon(
                                                      Icons.star,
                                                      size: 50,
                                                      color: Color(0xff540F63),
                                                    ),
                                                    Icon(
                                                      Icons.car_rental_rounded,
                                                      size: 50,
                                                      color: Color(0xff540F63),
                                                    ),
                                                    Column(
                                                      spacing: 10,
                                                      children: [
                                                        Text(
                                                          "Carro tal",
                                                          style: TextStyle(
                                                            fontSize: 14,
                                                          ),
                                                        ),
                                                        Text(
                                                          "Placa tal",
                                                          style: TextStyle(
                                                            fontSize: 14,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ],
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
                                                    color: Color(0xff540F63),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          5,
                                                        ),
                                                  ),
                                                  child: TextButton(
                                                    onPressed: () {
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder:
                                                              (context) =>
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
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                            0.15,
                                        height:
                                            MediaQuery.of(context).size.height *
                                            0.09,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                          border: Border.all(
                                            color: Color(0xff540F63),
                                          ),
                                        ),
                                        child: Icon(
                                          Icons.delete,
                                          color: Color(0xff932426),
                                          size: 45,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),

                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Color(0xff540F63),
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          spacing: 10,
                                          children: [
                                            Column(
                                              children: [
                                                Row(
                                                  spacing: 5,
                                                  children: [
                                                    Icon(
                                                      Icons.star,
                                                      size: 50,
                                                      color: Color(0xff540F63),
                                                    ),
                                                    Icon(
                                                      Icons.car_rental_rounded,
                                                      size: 50,
                                                      color: Color(0xff540F63),
                                                    ),
                                                    Column(
                                                      spacing: 10,
                                                      children: [
                                                        Text(
                                                          "Carro tal",
                                                          style: TextStyle(
                                                            fontSize: 14,
                                                          ),
                                                        ),
                                                        Text(
                                                          "Placa tal",
                                                          style: TextStyle(
                                                            fontSize: 14,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ],
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
                                                    color: Color(0xff540F63),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          5,
                                                        ),
                                                  ),
                                                  child: TextButton(
                                                    onPressed: () {
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder:
                                                              (context) =>
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
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                            0.15,
                                        height:
                                            MediaQuery.of(context).size.height *
                                            0.09,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                          border: Border.all(
                                            color: Color(0xff540F63),
                                          ),
                                        ),
                                        child: Icon(
                                          Icons.delete,
                                          color: Color(0xff932426),
                                          size: 45,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),

                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Color(0xff540F63),
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          spacing: 10,
                                          children: [
                                            Column(
                                              children: [
                                                Row(
                                                  spacing: 5,
                                                  children: [
                                                    Icon(
                                                      Icons.star,
                                                      size: 50,
                                                      color: Color(0xff540F63),
                                                    ),
                                                    Icon(
                                                      Icons.car_rental_rounded,
                                                      size: 50,
                                                      color: Color(0xff540F63),
                                                    ),
                                                    Column(
                                                      spacing: 10,
                                                      children: [
                                                        Text(
                                                          "Carro tal",
                                                          style: TextStyle(
                                                            fontSize: 14,
                                                          ),
                                                        ),
                                                        Text(
                                                          "Placa tal",
                                                          style: TextStyle(
                                                            fontSize: 14,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ],
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
                                                    color: Color(0xff540F63),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          5,
                                                        ),
                                                  ),
                                                  child: TextButton(
                                                    onPressed: () {
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder:
                                                              (context) =>
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
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                            0.15,
                                        height:
                                            MediaQuery.of(context).size.height *
                                            0.09,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                          border: Border.all(
                                            color: Color(0xff540F63),
                                          ),
                                        ),
                                        child: Icon(
                                          Icons.delete,
                                          color: Color(0xff932426),
                                          size: 45,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),

                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Color(0xff540F63),
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          spacing: 10,
                                          children: [
                                            Column(
                                              children: [
                                                Row(
                                                  spacing: 5,
                                                  children: [
                                                    Icon(
                                                      Icons.star,
                                                      size: 50,
                                                      color: Color(0xff540F63),
                                                    ),
                                                    Icon(
                                                      Icons.car_rental_rounded,
                                                      size: 50,
                                                      color: Color(0xff540F63),
                                                    ),
                                                    Column(
                                                      spacing: 10,
                                                      children: [
                                                        Text(
                                                          "Carro tal",
                                                          style: TextStyle(
                                                            fontSize: 14,
                                                          ),
                                                        ),
                                                        Text(
                                                          "Placa tal",
                                                          style: TextStyle(
                                                            fontSize: 14,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ],
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
                                                    color: Color(0xff540F63),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          5,
                                                        ),
                                                  ),
                                                  child: TextButton(
                                                    onPressed: () {
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder:
                                                              (context) =>
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
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                            0.15,
                                        height:
                                            MediaQuery.of(context).size.height *
                                            0.09,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                          border: Border.all(
                                            color: Color(0xff540F63),
                                          ),
                                        ),
                                        child: Icon(
                                          Icons.delete,
                                          color: Color(0xff932426),
                                          size: 45,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
