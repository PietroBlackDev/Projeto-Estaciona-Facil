import 'package:estaciona_facil/components/widget_label.dart';
import 'package:flutter/material.dart';

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
      body: Center(
        child: Column(
          children: [
            WidgetLabel(texto: "Confirmação"),
            Column(
              spacing: 20,
              children: [
                Text(
                  "Descrição do carro ABC 1A34",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                  mainAxisAlignment: MainAxisAlignment.center,
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
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.3,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  top: BorderSide(color: Colors.deepPurple, width: 2),
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Escolha uma forma de pagamento",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      spacing: 20,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.22,
                          height: MediaQuery.of(context).size.height * 0.1,
                          decoration: BoxDecoration(
                            color: Colors.purple,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
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
                            color: Colors.purple,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
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
                            color: Colors.purple,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            spacing: 5,
                            children: [
                              Icon(Icons.paypal, color: Colors.white, size: 42),
                              Text(
                                "BOLETO",
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
          ],
        ),
      ),
    );
  }
}
