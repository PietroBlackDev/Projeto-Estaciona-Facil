import 'package:estaciona_facil/components/botao_basico.dart';
import 'package:estaciona_facil/pages/Fluxo_Henrique/pagamento_um.dart';
import 'package:flutter/material.dart';

class TelaEstacionamentoDois extends StatefulWidget {
  const TelaEstacionamentoDois({super.key});

  @override
  State<TelaEstacionamentoDois> createState() => _TelaEstacionamentoDoisState();
}

class _TelaEstacionamentoDoisState extends State<TelaEstacionamentoDois> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height * 0.1,
                decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text("Saldo: 0,00"),
              ),

              Text("Selecione a placa do veículo."),

              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                height: MediaQuery.of(context).size.height * 0.25,
              ),

              BotaoBasico(texto: "Trocar", pagina: TelaEstacionamentoDois()),

              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.45,
                child: Column(
                  children: [
                    Text("Selecione o tempo de estacionamento:"),
                    Text("MÁXIMA PERMANÊNCIA", style: TextStyle(fontSize: 17)),

                    SizedBox(
                      child: Column(
                        spacing: 10,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [Text("1 Hora"), Text("")],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [Text("1 Hora"), Text("")],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [Text("1 Hora"), Text("")],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              BotaoBasico(texto: "Avançar", pagina: PagamentoUm()),
            ],
          ),
        ),
      ),
    );
  }
}
