import 'package:estaciona_facil/components/botao_basico.dart';
import 'package:estaciona_facil/components/input.dart';
import 'package:estaciona_facil/components/widget_label.dart';
import 'package:estaciona_facil/pages/Fluxo_Manu/fluxo_login/regularizar_aviso.dart';
import 'package:estaciona_facil/pages/Fluxo_Manu/widgets/container_valores.dart';
import 'package:flutter/material.dart';

class RegularizarAvisoQuatro extends StatefulWidget {
  const RegularizarAvisoQuatro({super.key, required this.pagamento});

  final String pagamento;

  @override
  State<RegularizarAvisoQuatro> createState() => _RegularizarAvisoQuatroState();
}

class _RegularizarAvisoQuatroState extends State<RegularizarAvisoQuatro> {
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
                        ContainerValores(nome: 'Valor', valor: '20'),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.6,
                          padding: EdgeInsets.only(top: 20),
                          decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(
                                color: Theme.of(context).colorScheme.secondary,
                                width: 2,
                              ),
                            ),
                          ),
                          child: Column(
                            spacing: 5,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.8,
                                height:
                                    MediaQuery.of(context).size.height * 0.12,
                                child: Input(
                                  visibilidade: false,
                                  label: 'Número titular do cartão:',
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.8,
                                height:
                                    MediaQuery.of(context).size.height * 0.12,
                                child: Input(
                                  visibilidade: false,
                                  label: 'Número cartão de crédito:',
                                ),
                              ),
                              Row(
                                spacing: 35,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                    height:
                                        MediaQuery.of(context).size.height *
                                        0.13,
                                    child: Input(
                                      visibilidade: false,
                                      label: 'Validade (mm/aa):',
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    height:
                                        MediaQuery.of(context).size.height *
                                        0.13,
                                    child: Input(
                                      visibilidade: false,
                                      label: 'CVV:',
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Row(
                                  spacing: 10,
                                  children: [
                                    Radio(
                                      value: "3 Horas",
                                      groupValue: "Horas",
                                      onChanged: (value) {},
                                    ),
                                    Text("Salvar cartão"),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 20),

                              Center(
                                child: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.8,
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
                        ),
                        BotaoBasico(
                          texto: "Início",
                          pagina: RegularizarAviso(),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: MediaQuery.of(context).size.height * 0.2,
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
