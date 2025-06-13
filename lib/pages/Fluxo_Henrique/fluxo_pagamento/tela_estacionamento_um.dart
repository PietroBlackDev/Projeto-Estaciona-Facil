import 'package:estaciona_facil/components/botao_basico.dart';
import 'package:estaciona_facil/components/widget_label.dart';
import 'package:estaciona_facil/pages/Fluxo_Henrique/fluxo_pagamento/tela_estacionamento_dois.dart';
import 'package:estaciona_facil/pages/Fluxo_Henrique/fluxo_veiculos/tela_veiculos_um.dart';
import 'package:flutter/material.dart';

class TelaEstacionamentoUm extends StatefulWidget {
  const TelaEstacionamentoUm({super.key});

  @override
  State<TelaEstacionamentoUm> createState() => _TelaEstacionamentoUmState();
}

class _TelaEstacionamentoUmState extends State<TelaEstacionamentoUm> {
  double saldo = 5.00;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            spacing: 30,
            children: [
              const WidgetLabel(texto: "Estacionar Agora"),
              Expanded(
                child: SingleChildScrollView(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.76,
                    child: Column(
                      spacing: 30,
                      children: [
                        BotaoBasico(
                          texto: "Saldo: ${saldo.toStringAsFixed(2)}",
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
                        Column(
                          spacing: 20,
                          children: [
                            BotaoBasico(texto: "Trocar", pagina: VeiculosUm()),
                            BotaoBasico(
                              texto: "Avançar",
                              pagina: TelaEstacionamentoDois(saldo: 5.00),
                            ),
                          ],
                        ),
                        Column(
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
