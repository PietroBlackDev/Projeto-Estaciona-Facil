import 'package:estaciona_facil/components/botao_basico.dart';
import 'package:estaciona_facil/components/widget_label.dart';
import 'package:estaciona_facil/pages/Fluxo_Manu/fluxo_login/regularizar_aviso.dart';
import 'package:estaciona_facil/pages/Fluxo_Manu/widgets/container_valores.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegularizarAvisoTres extends StatefulWidget {
  const RegularizarAvisoTres({super.key, required this.pagamento, this.valor, this.placaCarro});

  final String pagamento;
  final valor;
  final placaCarro;

  @override
  State<RegularizarAvisoTres> createState() => _RegularizarAvisoTresState();
}

class _RegularizarAvisoTresState extends State<RegularizarAvisoTres> {
  bool _botaoPix = false;
  bool _botaoCartao = false;
  String pagamento = '';
  String marcado = '';

  @override
  void initState() {
    super.initState();

    marcado = '';
    pagamento = '';
    _botaoPix = false;
    _botaoCartao = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            spacing: 20,
            children: [
              WidgetLabel(texto: 'Regularizar Aviso'),
              Expanded(
                child: SingleChildScrollView(
                  child: SizedBox(
                    child: Column(
                      spacing: 20,
                      children: [
                        ContainerValores(nome: 'Valor', valor: widget.valor),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 1,
                              height:
                                  MediaQuery.of(context).size.height * 0.005,
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.onPrimary,
                                borderRadius: BorderRadius.circular(10),
                                border: Border(
                                  top: BorderSide(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                    width: 2,
                                  ),
                                ),
                              ),
                            ),

                            const SizedBox(height: 26),
                            Text(
                              'PIX Copia e Cola:',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            Text(
                              '00020101021126640014BR.GOV.BCB.PIX0114c2b0f8-3d1e-4a5b-9c6f-7d8e2f1a2b3c520400005303986540testesaoroqueKDJGW23testeFacyukdad2345523',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Código PIX copiado com sucesso!',
                                    ),
                                    duration: Duration(seconds: 2),
                                  ),
                                );
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(Icons.copy, size: 20),
                                  SizedBox(width: 5),
                                  Text(
                                    'Copiar',
                                    style: TextStyle(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      fontFamily:
                                          GoogleFonts.ubuntu().fontFamily,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 20),
                            Text(
                              'Código QR Code:',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            SizedBox(height: 10),
                            Center(
                              child: Image.asset(
                                'assets/images/codigo_qr.png',
                                width: 200,
                                height: 200,
                              ),
                            ),
                            const SizedBox(height: 26),

                            Container(
                              width: MediaQuery.of(context).size.width * 1,
                              height:
                                  MediaQuery.of(context).size.height * 0.005,
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.onPrimary,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Center(
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.8,
                                height:
                                    MediaQuery.of(context).size.height * 0.07,
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: WidgetStatePropertyAll(
                                      Color(0xff932426),
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('Cancelar'),
                                ),
                              ),
                            ),
                          ],
                        ),
                        BotaoBasico(
                          texto: "Já Paguei",
                          pagina: RegularizarAviso(placaCarro: widget.placaCarro),
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
            ],
          ),
        ),
      ),
    );
  }
}

class BotaoPagamento extends StatelessWidget {
  const BotaoPagamento({super.key, required this.icone, required this.texto});

  final IconData icone;
  final String texto;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: MediaQuery.of(context).size.width * 0.28,
        height: MediaQuery.of(context).size.height * 0.12,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onPrimary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icone),
            Text(texto, style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
