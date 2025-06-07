import 'package:estaciona_facil/components/widget_label.dart';
import 'package:estaciona_facil/pages/Fluxo_Henrique/fluxo_veiculos/tela_veiculos_dois.dart';
import 'package:estaciona_facil/pages/Fluxo_Henrique/fluxo_veiculos/tela_veiculos_quatro.dart';
import 'package:estaciona_facil/pages/Fluxo_Henrique/fluxo_veiculos/tela_veiculos_um.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VeiculosSeis extends StatefulWidget {
  const VeiculosSeis({
    super.key,
    required this.icone,
    required this.caminhoImagem,
    required this.placa,
    required this.descricao,
  });

  final IconData icone;
  final String caminhoImagem;
  final String placa;
  final String descricao;

  @override
  State<VeiculosSeis> createState() => _VeiculosSeisState();
}

class _VeiculosSeisState extends State<VeiculosSeis> {
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
                  height: MediaQuery.of(context).size.height * 0.67,
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
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (context) => VeiculosQuatro(
                                            icone: widget.icone,
                                            caminhoImagem: widget.caminhoImagem,
                                          ),
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
                            "4. Descrição:",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            spacing: 50,
                            children: [
                              Text(
                                "Descrição do veículo",
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
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          backgroundColor:
                              Theme.of(context).colorScheme.secondary,
                          title: Center(
                            child: Text(
                              "Confirma a placa?",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: GoogleFonts.ubuntu().fontFamily,
                              ),
                            ),
                          ),
                          actions: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.5,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(0),
                              ),
                              child: Column(
                                spacing: 20,
                                children: [
                                  Text(
                                    "Atencão: Sempre atender para o correto preechimento da placa do veículo - a exatidão desta informação é indispensável para a efetividade das ativações.",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontFamily:
                                          GoogleFonts.ubuntu().fontFamily,
                                    ),
                                  ),

                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 3,
                                      ),
                                    ),
                                    padding: EdgeInsets.all(13),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Descrição do Carro",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: 'Arsenal',
                                          ),
                                        ),
                                        Text(
                                          "ABC 1A34",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 50,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: 'Arsenal',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    spacing: 50,
                                    children: [
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                          ),
                                        ),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text(
                                          "NÃO",
                                          style: TextStyle(
                                            color:
                                                Theme.of(
                                                  context,
                                                ).colorScheme.secondary,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),

                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                          ),
                                        ),
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder:
                                                  (context) => VeiculosUm(),
                                            ),
                                          );
                                        },
                                        child: Text(
                                          "SIM",
                                          style: TextStyle(
                                            color:
                                                Theme.of(
                                                  context,
                                                ).colorScheme.secondary,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                    child: Text("Salvar Novo Veículo"),
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
