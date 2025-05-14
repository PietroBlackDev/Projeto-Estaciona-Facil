import 'package:estaciona_facil/components/botao_basico.dart';
import 'package:estaciona_facil/pages/Fluxo_Henrique/tela_estacionamento_dois.dart';
import 'package:flutter/material.dart';

class TelaEstacionamentoUm extends StatefulWidget {
  const TelaEstacionamentoUm({super.key});

  @override
  State<TelaEstacionamentoUm> createState() => _TelaEstacionamentoUmState();
}

class _TelaEstacionamentoUmState extends State<TelaEstacionamentoUm> {
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

              BotaoBasico(texto: "Trocar", pagina: TelaEstacionamentoUm()),
              BotaoBasico(texto: "Avançar", pagina: TelaEstacionamentoDois()),
            ],
          ),
        ),
      ),
    );
  }
}
