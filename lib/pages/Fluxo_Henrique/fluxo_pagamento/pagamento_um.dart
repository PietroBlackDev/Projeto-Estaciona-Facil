import 'package:estaciona_facil/components/input.dart';
import 'package:estaciona_facil/components/widget_label.dart';
import 'package:estaciona_facil/pages/Fluxo_Henrique/fluxo_pagamento/pagamento_dois.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PagamentoUm extends StatefulWidget {
  const PagamentoUm({
    super.key,
    required this.placa,
    required this.saldo,
    required this.horas,
  });

  final String placa;
  final double saldo;
  final String horas;

  @override
  State<PagamentoUm> createState() => _PagamentoUmState();
}

class _PagamentoUmState extends State<PagamentoUm> {
  bool _clicadoPix = false;
  bool _clicadoCartao = false;

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
                WidgetLabel(texto: "Confirmação"),
                Center(
                  child: Column(
                    spacing: 20,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Descrição do carro ${widget.placa}",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Column(
                        spacing: 20,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            spacing: 20,
                            children: [
                              Column(
                                spacing: 20,
                                children: [
                                  Icon(
                                    Icons.access_time_filled,
                                    color: Colors.deepPurple,
                                    size: 40,
                                  ),
                                  Icon(
                                    Icons.attach_money,
                                    color: Colors.deepPurple,
                                    size: 40,
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                spacing: 20,
                                children: [
                                  Text(
                                    widget.horas,
                                    style: TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  Text(
                                    widget.saldo.toStringAsFixed(2),
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
                          crossAxisAlignment: CrossAxisAlignment.center,
                          spacing: 8,
                          children: [
                            _clicadoPix
                                ? Padding(
                                  padding: const EdgeInsets.only(
                                    right: 41,
                                    left: 41,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                            1,
                                        height:
                                            MediaQuery.of(context).size.height *
                                            0.005,
                                        decoration: BoxDecoration(
                                          color:
                                              Theme.of(
                                                context,
                                              ).colorScheme.onPrimary,
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                        ),
                                      ),

                                      const SizedBox(height: 26),
                                      Text(
                                        'PIX Copia e Cola:',
                                        style:
                                            Theme.of(
                                              context,
                                            ).textTheme.titleMedium,
                                      ),
                                      Text(
                                        '00020101021126640014BR.GOV.BCB.PIX0114c2b0f8-3d1e-4a5b-9c6f-7d8e2f1a2b3c520400005303986540testesaoroqueKDJGW23testeFacyukdad2345523',
                                        style:
                                            Theme.of(
                                              context,
                                            ).textTheme.bodyMedium,
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          ScaffoldMessenger.of(
                                            context,
                                          ).showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Código PIX copiado com sucesso!',
                                              ),
                                              duration: Duration(seconds: 2),
                                            ),
                                          );
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Icon(Icons.copy, size: 20),
                                            SizedBox(width: 5),
                                            Text(
                                              'Copiar',
                                              style: TextStyle(
                                                color:
                                                    Theme.of(
                                                      context,
                                                    ).colorScheme.primary,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500,
                                                fontFamily:
                                                    GoogleFonts.ubuntu()
                                                        .fontFamily,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 20),
                                      Text(
                                        'Código QR Code:',
                                        style:
                                            Theme.of(
                                              context,
                                            ).textTheme.titleMedium,
                                      ),
                                      SizedBox(height: 10),
                                      Center(
                                        child: Image.asset(
                                          'assets/images/codigo_qr.png',
                                          width: 200,
                                          height: 200,
                                        ),
                                      ),
                                      const SizedBox(height: 26),

                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                            1,
                                        height:
                                            MediaQuery.of(context).size.height *
                                            0.005,
                                        decoration: BoxDecoration(
                                          color:
                                              Theme.of(
                                                context,
                                              ).colorScheme.onPrimary,
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                      Center(
                                        child: SizedBox(
                                          width:
                                              MediaQuery.of(
                                                context,
                                              ).size.width *
                                              0.8,
                                          height:
                                              MediaQuery.of(
                                                context,
                                              ).size.height *
                                              0.07,
                                          child: ElevatedButton(
                                            style: ButtonStyle(
                                              backgroundColor:
                                                  WidgetStatePropertyAll(
                                                    Color(0xff932426),
                                                  ),
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                _clicadoPix = false;
                                              });
                                            },
                                            child: Text('Cancelar'),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                                : SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.25,
                                  height:
                                      MediaQuery.of(context).size.height * 0.1,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        _clicadoPix = true;
                                      });
                                    },
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      spacing: 2,
                                      children: [
                                        Icon(Icons.pix, size: 50),
                                        Text(
                                          'PIX',
                                          style: TextStyle(
                                            color:
                                                Theme.of(
                                                  context,
                                                ).colorScheme.primary,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            fontFamily:
                                                GoogleFonts.ubuntu().fontFamily,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                            _clicadoCartao
                                ? Padding(
                                  padding: const EdgeInsets.only(
                                    right: 41,
                                    left: 41,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height:
                                            MediaQuery.of(context).size.height *
                                            0.47,
                                        padding: EdgeInsets.only(top: 20),
                                        decoration: BoxDecoration(
                                          border: Border(
                                            top: BorderSide(
                                              color: Colors.deepPurple,
                                              width: 2,
                                            ),
                                          ),
                                        ),
                                        child: Column(
                                          spacing: 5,
                                          children: [
                                            SizedBox(
                                              width:
                                                  MediaQuery.of(
                                                    context,
                                                  ).size.width *
                                                  0.8,
                                              height:
                                                  MediaQuery.of(
                                                    context,
                                                  ).size.height *
                                                  0.12,
                                              child: Input(
                                                visibilidade: false,
                                                label:
                                                    'Número titular do cartão:',
                                              ),
                                            ),
                                            SizedBox(
                                              width:
                                                  MediaQuery.of(
                                                    context,
                                                  ).size.width *
                                                  0.8,
                                              height:
                                                  MediaQuery.of(
                                                    context,
                                                  ).size.height *
                                                  0.12,
                                              child: Input(
                                                visibilidade: false,
                                                label:
                                                    'Número cartão de crédito:',
                                              ),
                                            ),
                                            Row(
                                              spacing: 35,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                  width:
                                                      MediaQuery.of(
                                                        context,
                                                      ).size.width *
                                                      0.4,
                                                  height:
                                                      MediaQuery.of(
                                                        context,
                                                      ).size.height *
                                                      0.13,
                                                  child: Input(
                                                    visibilidade: false,
                                                    label: 'Validade (mm/aa):',
                                                  ),
                                                ),
                                                SizedBox(
                                                  width:
                                                      MediaQuery.of(
                                                        context,
                                                      ).size.width *
                                                      0.3,
                                                  height:
                                                      MediaQuery.of(
                                                        context,
                                                      ).size.height *
                                                      0.13,
                                                  child: Input(
                                                    visibilidade: false,
                                                    label: 'CVV:',
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                left: 20.0,
                                              ),
                                              child: Row(
                                                spacing: 10,
                                                children: [
                                                  Radio(
                                                    value: "3 Horas",
                                                    groupValue: "Horas",
                                                    onChanged: (value) {},
                                                  ),
                                                  Text("Salvar cartão"),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                      Center(
                                        child: SizedBox(
                                          width:
                                              MediaQuery.of(
                                                context,
                                              ).size.width *
                                              0.8,
                                          height:
                                              MediaQuery.of(
                                                context,
                                              ).size.height *
                                              0.07,
                                          child: ElevatedButton(
                                            style: ButtonStyle(
                                              backgroundColor:
                                                  WidgetStatePropertyAll(
                                                    Color(0xff932426),
                                                  ),
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                _clicadoCartao = false;
                                              });
                                            },
                                            child: Text('Cancelar'),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                                : SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.25,
                                  height:
                                      MediaQuery.of(context).size.height * 0.1,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        _clicadoCartao = true;
                                      });
                                    },
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      spacing: 2,
                                      children: [
                                        Icon(
                                          Icons.credit_card_rounded,
                                          size: 50,
                                        ),
                                        Text(
                                          'Cartão',
                                          style: TextStyle(
                                            color:
                                                Theme.of(
                                                  context,
                                                ).colorScheme.primary,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            fontFamily:
                                                GoogleFonts.ubuntu().fontFamily,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                          ],
                        ),
                      ],
                    ),
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
    );
  }
}
