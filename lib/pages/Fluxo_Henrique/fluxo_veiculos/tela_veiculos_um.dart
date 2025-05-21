import 'package:estaciona_facil/components/botao_basico.dart';
import 'package:estaciona_facil/components/widget_label.dart';
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
        child: Column(
          children: [
            WidgetLabel(texto: "Meus Veículos"),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.3,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  top: BorderSide(color: Colors.deepPurple, width: 2),
                ),
              ),
              child: Column(
                spacing: 30,
                children: [
                  Text(
                      "A placa com a estrela dourada será automaticamente carregada quando você for estacionar."),
                  Row(
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        size: 40,
                                        color: Color(0xff540F63),
                                      ),
                                      Icon(
                                        Icons.car_rental_rounded,
                                        size: 40,
                                        color: Color(0xff540F63),
                                      ),
                                      Column(
                                        children: [
                                          Text("Carro tal"),
                                          Text("Placa tal")
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Color(0xff540F63),
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Text("Estacionar"),
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.15,
                            height: MediaQuery.of(context).size.height * 0.08,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Color(0xff540F63))),
                            child: Icon(
                              Icons.delete,
                              color: Color(0xff540F63),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        size: 40,
                                        color: Color(0xff540F63),
                                      ),
                                      Icon(
                                        Icons.fire_truck_rounded,
                                        size: 40,
                                        color: Color(0xff540F63),
                                      ),
                                      Column(
                                        children: [
                                          Text("Carro tal"),
                                          Text("Placa tal")
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Color(0xff540F63),
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Text("Estacionar"),
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.15,
                            height: MediaQuery.of(context).size.height * 0.08,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Color(0xff540F63))),
                            child: Icon(
                              Icons.delete,
                              color: Color(0xff540F63),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        size: 40,
                                        color: Color(0xff540F63),
                                      ),
                                      Icon(
                                        Icons.motorcycle,
                                        size: 40,
                                        color: Color(0xff540F63),
                                      ),
                                      Column(
                                        children: [
                                          Text("Carro tal"),
                                          Text("Placa tal")
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Color(0xff540F63),
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Text("Estacionar"),
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.15,
                            height: MediaQuery.of(context).size.height * 0.08,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Color(0xff540F63))),
                            child: Icon(
                              Icons.delete,
                              color: Color(0xff540F63),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        size: 40,
                                        color: Color(0xff540F63),
                                      ),
                                      Icon(
                                        Icons.car_repair,
                                        size: 40,
                                        color: Color(0xff540F63),
                                      ),
                                      Column(
                                        children: [
                                          Text("Carro tal"),
                                          Text("Placa tal")
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Color(0xff540F63),
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Text("Estacionar"),
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.15,
                            height: MediaQuery.of(context).size.height * 0.08,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Color(0xff540F63))),
                            child: Icon(
                              Icons.delete,
                              color: Color(0xff540F63),
                            ),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            BotaoBasico(texto: "Cadastrar Novo Veículo", pagina: VeiculosDois())
          ],
        ),
      ),
    );
  }
}
