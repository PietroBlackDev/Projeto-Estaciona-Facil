import 'package:estaciona_facil/components/botao_basico.dart';
import 'package:estaciona_facil/components/widget_label.dart';
import 'package:estaciona_facil/pages/Fluxo_Henrique/fluxo_veiculos/tela_veiculos_seis.dart';
import 'package:flutter/material.dart';

class VeiculosCinco extends StatefulWidget {
  const VeiculosCinco({super.key});

  @override
  State<VeiculosCinco> createState() => _VeiculosCincoState();
}

class _VeiculosCincoState extends State<VeiculosCinco> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 60.0),
          child: Column(
            children: [
              WidgetLabel(texto: "Novo Veículo"),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.3,
                padding: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(color: Colors.deepPurple, width: 5),
                  ),
                ),
                child: Column(
                  spacing: 30,
                  children: [
                    Column(
                      children: [
                        Text(
                          "1. Categoria do veículo: ",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Row(
                          children: [
                            Text(
                              "Categoria\nselecionada",
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            Icon(
                              Icons.directions_car,
                              size: 40,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                "ALTERAR",
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              BotaoBasico(texto: "Avançar", pagina: VeiculosSeis()),

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
