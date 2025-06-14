import 'package:estaciona_facil/components/botao_basico.dart';
import 'package:estaciona_facil/components/widget_label.dart';
import 'package:estaciona_facil/pages/Fluxo_Manu/fluxo_login/regularizar_aviso_quatro.dart';
import 'package:estaciona_facil/pages/Fluxo_Manu/fluxo_login/regularizar_aviso_tres.dart';
import 'package:estaciona_facil/pages/Fluxo_Manu/widgets/container_valores.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegularizarAvisoDois extends StatefulWidget {
  const RegularizarAvisoDois({super.key});

  @override
  State<RegularizarAvisoDois> createState() => _RegularizarAvisoDoisState();
}

class _RegularizarAvisoDoisState extends State<RegularizarAvisoDois> {
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
          child: Column(
            spacing: 20,
            children: [
              WidgetLabel(texto: 'Regularizar Aviso'),
              Column(
                spacing: 20,
                children: [
                  ContainerValores(nome: 'Valor', valor: '20'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 40,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.12,
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            disabledBackgroundColor:
                                Theme.of(context).colorScheme.onPrimary,
                            disabledForegroundColor:
                                Theme.of(context).colorScheme.primary,
                            backgroundColor:
                                Theme.of(context).colorScheme.tertiary,
                          ),
                          onPressed:
                              _botaoPix
                                  ? null
                                  : () {
                                    setState(() {
                                      marcado = 'pix';
                                      _botaoPix = true;
                                      _botaoCartao = false;
                                      pagamento = 'PIX';
                                    });
                                  },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            spacing: 10,
                            children: [
                              Icon(Icons.pix, size: 50, color: Colors.white),
                              Text(
                                'Pix',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.12,
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            disabledBackgroundColor:
                                Theme.of(context).colorScheme.onPrimary,
                            disabledForegroundColor:
                                Theme.of(context).colorScheme.primary,
                            backgroundColor:
                                Theme.of(context).colorScheme.tertiary,
                          ),
                          onPressed:
                              _botaoCartao
                                  ? null
                                  : () {
                                    setState(() {
                                      marcado = 'cartão';
                                      _botaoCartao = true;
                                      _botaoPix = false;
                                      pagamento = 'CARTÃO';
                                    });
                                  },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            spacing: 10,
                            children: [
                              Icon(
                                Icons.payment,
                                size: 50,
                                color: Colors.white,
                              ),
                              Text(
                                'Cartão',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.07,
                child: ElevatedButton(
                  onPressed: () {
                    if (marcado == 'pix' && pagamento != '') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) =>
                                  RegularizarAvisoTres(pagamento: pagamento),
                        ),
                      );
                    } else if (marcado == 'cartão' && pagamento != '') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) =>
                                  RegularizarAvisoQuatro(pagamento: pagamento),
                        ),
                      );
                    } else {
                      showModalBottomSheet(
                        context: context,
                        builder: (_) {
                          return Container(
                            padding: EdgeInsets.all(20),
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height * 0.2,
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.onPrimary,
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
                                  color: Theme.of(context).colorScheme.surface,
                                  size: 60,
                                ),
                                Text(
                                  'Selecione a forma de pagamento!',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    }
                  },
                  child: Text('Avançar'),
                ),
              ),

              Image.asset('assets/images/Logo.png', width: 120, height: 120),
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
