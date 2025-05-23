import 'package:estaciona_facil/components/widget_label.dart';
import 'package:estaciona_facil/pages/Fluxo_Manu/widgets/container_valores.dart';
import 'package:flutter/material.dart';

class RegularizarAvisoDois extends StatefulWidget {
  const RegularizarAvisoDois({super.key});

  @override
  State<RegularizarAvisoDois> createState() => _RegularizarAvisoDoisState();
}

class _RegularizarAvisoDoisState extends State<RegularizarAvisoDois> {
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BotaoPagamento(icone: Icons.money, texto: 'PIX'),
                      BotaoPagamento(icone: Icons.money, texto: 'Cartão'),
                      BotaoPagamento(icone: Icons.money, texto: 'Boleto'),
                    ],
                  ),
                ],
              ),
              Divider(thickness: 2),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'PIX Copia e Cola:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text(
                    '00020126360014BR.GOV.BCB.PIX0114+55159999999995204000053039865802BR5905teste6009sao roque62180514testeFaculdade63042218',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.45,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Row(
                    spacing: 5,
                    children: [
                      Icon(Icons.copy, size: 20),
                      Text('Copiar Código', style: TextStyle(fontSize: 15)),
                    ],
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Código QR:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 150,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage('assets/images/codigo_qr.png'))
                    ),
                  ),
                ],
              ),
              Divider(thickness: 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(onPressed: () {}, child: Text('Já paguei')),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Cancelar'),
                  ),
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
