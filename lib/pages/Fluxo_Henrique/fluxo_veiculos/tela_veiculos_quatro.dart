import 'package:estaciona_facil/components/widget_label.dart';
import 'package:estaciona_facil/pages/Fluxo_Henrique/fluxo_veiculos/tela_veiculos_cinco.dart';
import 'package:estaciona_facil/pages/Fluxo_Henrique/fluxo_veiculos/tela_veiculos_dois.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VeiculosQuatro extends StatefulWidget {
  const VeiculosQuatro({
    super.key,
    required this.icone,
    required this.caminhoImagem,
  });

  final IconData icone;
  final String caminhoImagem;

  @override
  State<VeiculosQuatro> createState() => _VeiculosQuatroState();
}

class _VeiculosQuatroState extends State<VeiculosQuatro> {
  final TextEditingController _controller = TextEditingController();

  void dispose() {
    _controller.dispose(); // liberar o controller ao sair do widget
    super.dispose();
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
              const WidgetLabel(texto: "Novo Veículo"),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
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
                              spacing: 40,
                              children: [
                                Icon(
                                  widget.icone,
                                  size: 50,
                                  color:
                                      Theme.of(context).colorScheme.secondary,
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
                                      fontFamily:
                                          GoogleFonts.ubuntu().fontFamily,
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
                              spacing: 40,
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
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    "ALTERAR",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontFamily:
                                          GoogleFonts.ubuntu().fontFamily,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),

                        Column(
                          spacing: 30,
                          children: [
                            Text(
                              "3. Qual a placa do veículo?",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              height: MediaQuery.of(context).size.height * 0.08,
                              child: Column(
                                children: [
                                  TextFormField(
                                    controller: _controller,
                                    decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.symmetric(
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

                        ElevatedButton(
                          onPressed: () {
                            if (_controller.text == '') {
                              showModalBottomSheet(
                                context: context,
                                builder: (_) {
                                  return Container(
                                    padding: EdgeInsets.all(20),
                                    width: double.infinity,
                                    height:
                                        MediaQuery.of(context).size.height *
                                        0.2,
                                    decoration: BoxDecoration(
                                      color:
                                          Theme.of(
                                            context,
                                          ).colorScheme.onPrimary,
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
                                              Theme.of(
                                                context,
                                              ).colorScheme.surface,
                                          size: 60,
                                        ),
                                        Text(
                                          'Informe a placa do veículo!',
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
                            } else {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (context) => VeiculosCinco(
                                        icone: widget.icone,
                                        caminhoImagem: widget.caminhoImagem,
                                        placa: _controller.text,
                                      ),
                                ),
                              );
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 20,
                              horizontal: 50,
                            ),
                            child: Text("Salvar Novo Veículo"),
                          ),
                        ),

                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: MediaQuery.of(context).size.height * 0.17,
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
            ],
          ),
        ),
      ),
    );
  }
}
