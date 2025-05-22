import 'package:estaciona_facil/components/botao_basico.dart';
import 'package:estaciona_facil/pages/Fluxo_Manu/fluxo_login/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EfetuarLogin extends StatefulWidget {
  const EfetuarLogin({super.key});

  @override
  State<EfetuarLogin> createState() => _EfetuarLoginState();
}

class _EfetuarLoginState extends State<EfetuarLogin> {
  bool obscureAtivo = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 90),
          child: Column(
            spacing: 20,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/images/Logo.png', width: 120, height: 120),
              SizedBox(height: 35),
              SizedBox(
                width: 350,
                child: TextFormField(
                  obscureText: obscureAtivo,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff540F63)),
                    ),
                    labelStyle: TextStyle(color: Color(0xff540F63)),
                    hoverColor: Color(0xff540F63),
                    focusColor: Color(0xff540F63),
                    fillColor: Color(0xff540F63),

                    labelText: 'CPF ou CNPJ',
                    prefixIcon: const Icon(
                      Icons.person,
                      color: Color(0xff540F63),
                      size: 40,
                    ),
                  ),
                ),
              ),

              SizedBox(
                width: 350,
                child: TextField(
                  obscureText: obscureAtivo,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff540F63)),
                    ),
                    labelStyle: TextStyle(color: Color(0xff540F63)),
                    hoverColor: Color(0xff540F63),
                    focusColor: Color(0xff540F63),
                    fillColor: Color(0xff540F63),

                    labelText: 'Senha',
                    prefixIcon: const Icon(
                      Icons.lock,
                      color: Color(0xff540F63),
                      size: 40,
                    ),
                    suffixIcon: InkWell(
                      child: const Icon(Icons.remove_red_eye_outlined, color: Color(0xff540F63),),
                      onTap: () {
                        obscureAtivo = !obscureAtivo;
                        setState(() {});
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 23),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Esqueceu a senha?',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: GoogleFonts.ubuntu().fontFamily,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Center(
                child: BotaoBasico(texto: 'Entrar', pagina: Home()),
              ),

              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 5,
                    children: [
                      Text(
                        'Ainda não possui uma conta?',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: GoogleFonts.ubuntu().fontFamily,
                        ),
                      ),
                      Text(
                        'Cadastre-se',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color(0xff540F63),
                          fontWeight: FontWeight.bold,
                          fontFamily: GoogleFonts.ubuntu().fontFamily,
                          decoration: TextDecoration.underline,
                        ),
                      )
                    ],
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
