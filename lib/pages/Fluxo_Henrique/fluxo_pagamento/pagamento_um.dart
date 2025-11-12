import 'package:estaciona_facil/components/widget_label.dart';
import 'package:estaciona_facil/pages/Fluxo_Henrique/fluxo_pagamento/pagamento_dois.dart';
import 'package:estaciona_facil/pages/Fluxo_Henrique/fluxo_pagamento/pagamento_tres.dart';
import 'package:estaciona_facil/pages/Fluxo_Manu/fluxo_login/efetuar_login.dart';
import 'package:flutter/material.dart';

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
  bool _botaoPix = false;
  bool _botaoCartao = false;
  String pagamento = '';
  String marcado = '';
  double valorPago = 0.0;

  @override
  void initState() {
    super.initState();

    marcado = '';
    pagamento = '';
    _botaoPix = false;
    _botaoCartao = false;
    if (widget.horas == "3 horas") {
      valorPago = 15.00;
    } else if (widget.horas == "2 horas") {
      valorPago = 10.00;
    } else if (widget.horas == "1 hora") {
      valorPago = 5.00;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            spacing: 20,
            children: [
              const WidgetLabel(texto: "Confirmação"),
              Expanded(
                child: SingleChildScrollView(
                  child: Center(
                    child: Column(
                      spacing: 20,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "${box.read('descricao')} ${box.read('placa_veiculo')}",
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
                                      valorPago.toStringAsFixed(2),
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
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.25,
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
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.12,
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                disabledBackgroundColor:
                                    Theme.of(context).colorScheme.onPrimary,
                                disabledForegroundColor:
                                    Theme.of(context).colorScheme.primary,
                                backgroundColor:
                                    Theme.of(context).colorScheme.tertiary,
                              ),
                              onPressed:
                                  _botaoPix
                                      ? null
                                      : () {
                                        setState(() {
                                          marcado = 'pix';
                                          _botaoPix = true;
                                          _botaoCartao = false;
                                          pagamento = 'PIX';
                                        });
                                      },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                spacing: 10,
                                children: [
                                  Icon(
                                    Icons.pix,
                                    size: 50,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    'Pix',
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.12,
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                disabledBackgroundColor:
                                    Theme.of(context).colorScheme.onPrimary,
                                disabledForegroundColor:
                                    Theme.of(context).colorScheme.primary,
                                backgroundColor:
                                    Theme.of(context).colorScheme.tertiary,
                              ),
                              onPressed:
                                  _botaoCartao
                                      ? null
                                      : () {
                                        setState(() {
                                          marcado = 'cartão';
                                          _botaoCartao = true;
                                          _botaoPix = false;
                                          pagamento = 'CARTÃO';
                                        });
                                      },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                spacing: 10,
                                children: [
                                  Icon(
                                    Icons.payment,
                                    size: 50,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    'Cartão',
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600,
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
                height: MediaQuery.of(context).size.height * 0.07,
                child: ElevatedButton(
                  onPressed: () {
                    if (marcado == 'pix' && pagamento != '') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => PagamentoTres(
                                placa: widget.placa,
                                saldo: valorPago,
                                horas: widget.horas,
                                pagamento: pagamento,
                              ),
                        ),
                      );
                    } else if (marcado == 'cartão' && pagamento != '') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => PagamentoDois(
                                placa: widget.placa,
                                saldo: valorPago,
                                horas: widget.horas,
                                pagamento: pagamento,
                              ),
                        ),
                      );
                    } else {
                      showModalBottomSheet(
                        context: context,
                        builder: (_) {
                          return Container(
                            padding: EdgeInsets.all(20),
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height * 0.2,
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.onPrimary,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                            ),
                            child: Column(
                              spacing: 10,
                              children: [
                                Icon(
                                  Icons.error_outline,
                                  color: Theme.of(context).colorScheme.surface,
                                  size: 60,
                                ),
                                Text(
                                  'Selecione a forma de pagamento!',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    }
                  },
                  child: Text('Avançar'),
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
    );
  }
}
