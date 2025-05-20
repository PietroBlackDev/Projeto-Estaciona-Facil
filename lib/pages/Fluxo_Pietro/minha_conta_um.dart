import 'package:estaciona_facil/components/modal_confirmacao.dart';
import 'package:estaciona_facil/components/widget_label.dart';
import 'package:estaciona_facil/pages/Fluxo_Pietro/minha_conta_dois.dart';
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
        padding: const EdgeInsets.only(top: 50),
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
                        Icon(
                          Icons.person,
                          color: Color.fromARGB(255, 42, 42, 42),
                          size: 30,
                        ),
                        Text(
                          'Dados Gerais',
                          style: TextStyle(
                            color: Color.fromARGB(255, 42, 42, 42),
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),

                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MinhaContaDois(),
                        ),
                      );
                    },
                    child: Row(
                      spacing: 5,
                      children: [
                        Icon(
                          Icons.edit_square,
                          color: Color.fromARGB(255, 42, 42, 42),
                          size: 25,
                        ),
                        Text(
                          'Alterar Senha',
                          style: TextStyle(
                            color: Color.fromARGB(255, 42, 42, 42),
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
                          Icon(
                            Icons.person,
                            color: Color.fromARGB(255, 42, 42, 42),
                            size: 30,
                          ),

                          Icon(
                            Icons.email,
                            color: Color.fromARGB(255, 42, 42, 42),
                            size: 30,
                          ),

                          Icon(
                            Icons.call,
                            color: Color.fromARGB(255, 42, 42, 42),
                            size: 30,
                          ),

                          Icon(
                            Icons.contact_emergency,
                            color: Color.fromARGB(255, 42, 42, 42),
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
                              color: Color.fromARGB(255, 42, 42, 42),
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Arsenal',
                            ),
                          ),

                          Text(
                            'Email do usuário',
                            style: TextStyle(
                              color: Color.fromARGB(255, 42, 42, 42),
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Arsenal',
                            ),
                          ),

                          Text(
                            'Numero de telefone',
                            style: TextStyle(
                              color: Color.fromARGB(255, 42, 42, 42),
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Arsenal',
                            ),
                          ),

                          Text(
                            'CPF ou CNPJ',
                            style: TextStyle(
                              color: Color.fromARGB(255, 42, 42, 42),
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
    );
  }
}
