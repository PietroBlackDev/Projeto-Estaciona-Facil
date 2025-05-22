import 'package:flutter/material.dart';

class ContainerValores extends StatelessWidget {
  const ContainerValores({super.key, required this.nome, required this.valor});

  final String nome;
  final String valor;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      height: MediaQuery.of(context).size.height * 0.08,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimary,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('$nome: R\$ $valor,00', style: TextStyle(color: Colors.white, fontSize: 25),),
        ],
      ),
    );
  }
}
