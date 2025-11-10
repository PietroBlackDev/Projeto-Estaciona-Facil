import 'package:estaciona_facil/components/widget_label.dart';
import 'package:estaciona_facil/pages/Fluxo_Pietro/historico_dois.dart';
import 'package:estaciona_facil/pages/Fluxo_Pietro/historico_tres.dart';
import 'package:flutter/material.dart';

class Historico extends StatefulWidget {
  const Historico({super.key});

  @override
  State<Historico> createState() => _HistoricoState();
}

class _HistoricoState extends State<Historico> {
  
  bool _botaoAtivacao = false;
  bool _botaoCompra = false;
  String marcado = '';
  String periodo = '';

  @override
  void initState() {
    super.initState();
    periodo = '';
    marcado = '';
    _botaoAtivacao = false;
    _botaoCompra = false;
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
              WidgetLabel(texto: 'Histórico'),
              const SizedBox(height: 20),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Escolha o tipo de transação:',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  SizedBox(height: 22),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.08,
                        width: MediaQuery.of(context).size.width * 0.46,
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
                              _botaoAtivacao
                                  ? null
                                  : () {
                                    setState(() {
                                      marcado = 'ativacao';
                                      _botaoAtivacao = true;
                                      _botaoCompra = false;
                                    });
                                  },
                          child: Text(
                            'Ativação',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.08,
                        width: MediaQuery.of(context).size.width * 0.46,
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
                              _botaoCompra
                                  ? null
                                  : () {
                                    setState(() {
                                      marcado = 'compra';
                                      _botaoCompra = true;
                                      _botaoAtivacao = false;
                                    });
                                  },
                          child: Text(
                            'Compra',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.35),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.07,
                    child: ElevatedButton(
                      onPressed: () {
                        if (marcado == 'ativacao') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (context) => HistoricoDois(),
                            ),
                          );
                        } else if (marcado == 'compra') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (context) => HistoricoTres(),
                            ),
                          );
                        } else {
                          showModalBottomSheet(
                            context: context,
                            builder: (_) {
                              return Container(
                                padding: EdgeInsets.all(20),
                                width: double.infinity,
                                height:
                                    MediaQuery.of(context).size.height * 0.2,
                                decoration: BoxDecoration(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
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
                                      color:
                                          Theme.of(context).colorScheme.surface,
                                      size: 60,
                                    ),
                                    Text(
                                      'Selecione o Tipo que deseja visualizar o histórico!',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color:
                                            Theme.of(
                                              context,
                                            ).colorScheme.primary,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        }
                      },
                      child: Text('Ver Histórico'),
                    ),
                  ),
                ],
              ),

              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.21,
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
