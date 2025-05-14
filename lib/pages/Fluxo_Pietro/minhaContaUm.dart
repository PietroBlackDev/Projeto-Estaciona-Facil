import 'package:estaciona_facil/components/modal_confirmacao.dart';
import 'package:estaciona_facil/components/widget_label.dart';
import 'package:flutter/material.dart';

class Minhacontaum extends StatefulWidget {
  const Minhacontaum({super.key});

  @override
  State<Minhacontaum> createState() => _MinhacontaumState();
}

class _MinhacontaumState extends State<Minhacontaum> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 60),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              WidgetLabel(texto: 'Minha Conta'),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Row(
                      spacing: 4,
                      children: [
                        Icon(Icons.person, color: Colors.black, size: 30),
                        Text(
                          'Dados Gerais',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),

                  TextButton(
                    onPressed: () {},
                    child: Row(
                      spacing: 5,
                      children: [
                        Icon(Icons.edit_square, color: Colors.black, size: 25),
                        Text(
                          'Alterar Senha',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Container(
                width: MediaQuery.of(context).size.width * 1,
                height: MediaQuery.of(context).size.height * 0.005,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onPrimary,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(height: 30),
              Text('Meus Dados', style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 30),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Column(
                        spacing: 15,
                        children: [
                          Icon(Icons.person, color: Colors.black, size: 30),

                          Icon(Icons.email, color: Colors.black, size: 30),

                          Icon(Icons.call, color: Colors.black, size: 30),

                          Icon(
                            Icons.contact_emergency,
                            color: Colors.black,
                            size: 28,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 15),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 20,
                        children: [
                          Text(
                            'Nome do usuário',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            ),
                          ),

                          Text(
                            'Email do usuário',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            ),
                          ),

                          Text(
                            'Numero de telefone',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            ),
                          ),

                          Text(
                            'CPF ou CNPJ',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 90),
              ModalConfirmacao(texto: 'Salvar'),
              const SizedBox(height: 60),
              Image.asset('assets/images/Logo.png', width: 120, height: 120),
            ],
          ),
        ),
      ),
    );
  }
}
