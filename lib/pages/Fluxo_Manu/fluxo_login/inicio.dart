import 'package:estaciona_facil/components/botao_basico.dart';
import 'package:estaciona_facil/pages/Fluxo_Joao/cadastro_um.dart';
import 'package:estaciona_facil/pages/Fluxo_Manu/fluxo_login/efetuar_login.dart';
import 'package:flutter/material.dart';

class Inicio extends StatefulWidget {
  const Inicio({super.key});

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          spacing: 50,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/Logo.png', width: 120, height: 120),
            Column(
              spacing: 10,
              children: [
                BotaoBasico(texto: 'Cadastre-se', pagina: CadastroPage(),),
                Row(
                  children: [
                    Expanded(child: Divider(thickness: 2, )),
                    Text(' ou '),
                    Expanded(child: Divider(thickness: 2,)),
                  ],
                ),
                BotaoBasico(texto: 'Entrar', pagina: EfetuarLogin()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
