import 'package:estaciona_facil/components/botao_basico.dart';
import 'package:estaciona_facil/components/widget_label.dart';
import 'package:flutter/material.dart';

class Historico extends StatefulWidget {
  const Historico({super.key});

  @override
  State<Historico> createState() => _HistoricoState();
}

bool _botaoAtivacao = false;
bool _botaoCompra = false;
bool _botaoTresDias = false;
bool _botaoDozeDias = false;
bool _botaoMesPassado = false;
bool _botaoEsteMes = false;

class _HistoricoState extends State<Historico> {
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
                          onPressed:
                              _botaoAtivacao
                                  ? null
                                  : () {
                                    setState(() {
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
                          onPressed:
                              _botaoCompra
                                  ? null
                                  : () {
                                    setState(() {
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
                  SizedBox(height: 40),
                  Text(
                    'Escolha o período:',
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
                          onPressed:
                              _botaoTresDias
                                  ? null
                                  : () {
                                    setState(() {
                                      _botaoTresDias = true;
                                      _botaoDozeDias = false;
                                      _botaoMesPassado = false;
                                      _botaoEsteMes = false;
                                    });
                                  },
                          child: Text(
                            'Últimos 3 dias',
                            style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.08,
                        width: MediaQuery.of(context).size.width * 0.46,
                        child: ElevatedButton(
                          onPressed:
                              _botaoEsteMes
                                  ? null
                                  : () {
                                    setState(() {
                                      _botaoTresDias = false;
                                      _botaoDozeDias = false;
                                      _botaoMesPassado = false;
                                      _botaoEsteMes = true;
                                    });
                                  },
                          child: Text(
                            'Este mês',
                            style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.08,
                        width: MediaQuery.of(context).size.width * 0.46,
                        child: ElevatedButton(
                          onPressed:
                              _botaoMesPassado
                                  ? null
                                  : () {
                                    setState(() {
                                      _botaoTresDias = false;
                                      _botaoDozeDias = false;
                                      _botaoMesPassado = true;
                                      _botaoEsteMes = false;
                                    });
                                  },
                          child: Text(
                            'Mês passado',
                            style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.08,
                        width: MediaQuery.of(context).size.width * 0.46,
                        child: ElevatedButton(
                          onPressed:
                              _botaoDozeDias
                                  ? null
                                  : () {
                                    setState(() {
                                      _botaoTresDias = false;
                                      _botaoDozeDias = true;
                                      _botaoMesPassado = false;
                                      _botaoEsteMes = false;
                                    });
                                  },
                          child: Text(
                            'Últimos 12 dias',
                            style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.08),
                  BotaoBasico(texto: 'Ver Histórico', pagina: Historico()),
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
