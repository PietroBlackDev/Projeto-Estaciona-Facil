import 'package:estaciona_facil/components/botao_basico.dart';
import 'package:estaciona_facil/components/botao_basico_pop.dart';
import 'package:estaciona_facil/components/widget_label.dart';
import 'package:estaciona_facil/pages/Fluxo_Manu/fluxo_login/regularizar_aviso_dois.dart';
import 'package:flutter/material.dart';

class RegularizarAviso extends StatefulWidget {
  const RegularizarAviso({super.key, this.placaCarro});

  final placaCarro;

  @override
  State<RegularizarAviso> createState() => _RegularizarAvisoState();
}

class _RegularizarAvisoState extends State<RegularizarAviso> {
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
          child: Column(
            spacing: 60,
            children: [
              WidgetLabel(texto: 'Regularizar Aviso'),
              Column(
                spacing: 20,
                children: [
                  Text(
                    'Placas com aviso regularizado:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Text(
                          "Descrição do Carro",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Text(
                          widget.placaCarro ?? 'Placa Carro',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 65,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Arsenal',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                spacing: 20,
                children: [
                  BotaoBasico(
                    texto: 'Regularizar',
                    pagina: RegularizarAvisoDois(),
                  ),
                  BotaoBasicoPop(texto: 'Voltar'),
                ],
              ),

              Image.asset('assets/images/Logo.png', width: 120, height: 120),
            ],
          ),
        ),
      ),
    );
  }
}
