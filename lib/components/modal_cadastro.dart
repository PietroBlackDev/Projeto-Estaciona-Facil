// lib/components/modal_cadastro.dart

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart'; // Certifique-se de ter o pacote lottie no seu pubspec.yaml
import 'package:estaciona_facil/pages/Fluxo_Manu/fluxo_login/efetuar_login.dart'; // Importe a página de destino

/// Um StatelessWidget que define o conteúdo do AlertDialog de confirmação.
/// Este widget não é um botão; ele é o próprio corpo do modal.
class ConfirmationAlertDialogContent extends StatelessWidget {
  const ConfirmationAlertDialogContent({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: const Center(
        child: Text(
          'Cadastro efetuado com sucesso!',
          textAlign: TextAlign.center, // Centraliza o texto no título
        ),
      ),
      content: Lottie.asset('assets/lottie/confirmado.json'), // Caminho para sua animação Lottie
      actions: [
        Center( // Centraliza o botão dentro da área de ações
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.05,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), // Arredonda as bordas do container
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.secondary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Arredonda as bordas do botão
                ),
              ),
              onPressed: () {
                // Navega para a tela de login após a confirmação
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EfetuarLogin()),
                );
              },
              child: const Text(
                "OK",
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

/// Função utilitária para exibir o modal de confirmação em qualquer lugar da árvore de widgets.
void showConfirmationModal(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return const ConfirmationAlertDialogContent();
    },
  );
}