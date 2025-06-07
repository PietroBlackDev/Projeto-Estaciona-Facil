import 'package:estaciona_facil/components/botao_basico.dart';
import 'package:estaciona_facil/components/input.dart';
import 'package:estaciona_facil/components/widget_label.dart';
import 'package:estaciona_facil/pages/Fluxo_Henrique/fluxo_veiculos/tela_veiculos_dois.dart';
import 'package:estaciona_facil/pages/Fluxo_Henrique/fluxo_veiculos/tela_veiculos_seis.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VeiculosCinco extends StatefulWidget {
  const VeiculosCinco({
    super.key,
    required this.icone,
    required this.caminhoImagem,
    required this.placa,
  });

  final IconData icone;
  final String caminhoImagem;
  final String placa;

  @override
  State<VeiculosCinco> createState() => _VeiculosCincoState();
}

class _VeiculosCincoState extends State<VeiculosCinco> {
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
                WidgetLabel(texto: "Novo Veículo"),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.85,
                  padding: EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color: Theme.of(context).colorScheme.secondary,
                        width: 5,
                      ),
                    ),
                  ),
                  child: Column(
                    spacing: 30,
                    children: [
                      Column(
                        spacing: 20,
                        children: [
                          Text(
                            "1. Categoria do veículo: ",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            spacing: 50,
                            children: [
                              Icon(
                                Icons.directions_car,
                                size: 50,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                              TextButton(
                                style: TextButton.styleFrom(
                                  backgroundColor:
                                      Theme.of(context).colorScheme.secondary,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => VeiculosDois(),
                                    ),
                                  );
                                },
                                child: Text(
                                  "ALTERAR",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontFamily: GoogleFonts.ubuntu().fontFamily,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        spacing: 20,
                        children: [
                          Text(
                            "2. Padrão da placa: ",
                            style: Theme.of(context).textTheme.titleMedium,
                            textAlign: TextAlign.left,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            spacing: 50,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                spacing: 10,
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.2,
                                    height:
                                        MediaQuery.of(context).size.height *
                                        0.05,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "ABC 1A34",
                                          style:
                                              Theme.of(
                                                context,
                                              ).textTheme.bodySmall,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    "Mercosul",
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                ],
                              ),
                              TextButton(
                                style: TextButton.styleFrom(
                                  backgroundColor:
                                      Theme.of(context).colorScheme.secondary,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                onPressed: () {},
                                child: Text(
                                  "ALTERAR",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontFamily: GoogleFonts.ubuntu().fontFamily,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      Column(
                        spacing: 20,
                        children: [
                          Text(
                            "3. Placa:",
                            style: Theme.of(context).textTheme.titleMedium,
                            textAlign: TextAlign.left,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            spacing: 50,
                            children: [
                              Text(
                                "Placa do veículo",
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              TextButton(
                                style: TextButton.styleFrom(
                                  backgroundColor:
                                      Theme.of(context).colorScheme.secondary,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  "ALTERAR",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontFamily: GoogleFonts.ubuntu().fontFamily,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      Column(
                        spacing: 20,
                        children: [
                          Text(
                            "4. Qual é a descrição do veículo?",
                            style: Theme.of(context).textTheme.titleMedium,
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            "Caso queira,informe uma descrição para identificar o veículo, por exemplo `FIAT ARGO`ou `CARRO AZUL` A descrição será exibida junto à placa quando você for estacionar.",
                            style: Theme.of(context).textTheme.bodyMedium,
                            textAlign: TextAlign.center,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: MediaQuery.of(context).size.height * 0.13,
                            child: Input(
                              visibilidade: false,
                              label: "Descrição do veículo (Ex: Fiat Argo)",
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                BotaoBasico(
                  texto: "Avançar",
                  pagina: VeiculosSeis(
                    icone: widget.icone,
                    caminhoImagem: widget.caminhoImagem,
                    placa: "",
                    descricao: "",
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
