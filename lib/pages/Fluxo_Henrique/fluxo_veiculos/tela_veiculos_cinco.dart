import 'package:estaciona_facil/components/botao_basico.dart';
import 'package:estaciona_facil/components/widget_label.dart';
import 'package:estaciona_facil/pages/Fluxo_Henrique/fluxo_veiculos/tela_veiculos_dois.dart';
import 'package:estaciona_facil/pages/Fluxo_Henrique/fluxo_veiculos/tela_veiculos_seis.dart';
import 'package:estaciona_facil/pages/Fluxo_Henrique/fluxo_veiculos/tela_veiculos_tres.dart';
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
  final TextEditingController _controller = TextEditingController();

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
                                widget.icone,
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
                              Image.asset(widget.caminhoImagem, scale: 3),
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
                                          (context) =>
                                              VeiculosTres(icone: widget.icone),
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
                            "3. Placa:",
                            style: Theme.of(context).textTheme.titleMedium,
                            textAlign: TextAlign.left,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            spacing: 50,
                            children: [
                              Text(
                                widget.placa.toString(),
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
                            child: Column(
                              spacing: 40,
                              children: [
                                TextFormField(
                                  controller: _controller,
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(
                                      vertical: 15,
                                      horizontal: 20,
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color:
                                            Theme.of(context)
                                                .colorScheme
                                                .onPrimary, // mesma cor da borda ao focar
                                        width: 2,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color:
                                            Theme.of(
                                              context,
                                            ).colorScheme.onPrimary,
                                        width: 2,
                                      ),
                                    ),
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
                BotaoBasico(
                  texto: "Avançar",
                  pagina: VeiculosSeis(
                    icone: widget.icone,
                    caminhoImagem: widget.caminhoImagem,
                    placa: widget.placa,
                    descricao: _controller.text,
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
