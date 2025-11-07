import 'package:dio/dio.dart';
import 'package:estaciona_facil/pages/Fluxo_Joao/cadastro_um.dart';
import 'package:estaciona_facil/pages/Fluxo_Manu/fluxo_login/home.dart';
import 'package:estaciona_facil/pages/Fluxo_Manu/fluxo_recuperar.dart/recuperar_senha.dart';
import 'package:estaciona_facil/pages/shared/loading.dart';
import 'package:estaciona_facil/pages/shared/modal.dart';
import 'package:estaciona_facil/services/UserService.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

final box = GetStorage();

class EfetuarLogin extends StatefulWidget {
  const EfetuarLogin({super.key});

  @override
  State<EfetuarLogin> createState() => _EfetuarLoginState();
}



class _EfetuarLoginState extends State<EfetuarLogin> {
  bool obscureAtivo = true;

  final _formKey = GlobalKey<FormState>();
  final _inputLogin = TextEditingController();
  final _inputSenha = TextEditingController();

  bool _isObscure = false;

  String email = '';
  String id = '';

  Future<bool> login() async {
    try {
      Loading.show(context, mensagem: 'Aguarde...');

      Dio dio = Dio(
        BaseOptions(
          connectTimeout: Duration(seconds: 20),
          receiveTimeout: Duration(seconds: 30),
          validateStatus: (status) {
            return status! < 500;
          },
        ),
      );

      final formData = FormData.fromMap({
        'Email': _inputLogin.text,
        'Senha': _inputSenha.text,
      });

      final response = await dio.post(
        'http://192.168.100.79/Projeto-Estaciona-Facil-API/usuarios/login',
        data: formData,
      );

      if (response.statusCode == 200) {
        // --- CORREÇÃO APLICADA: Verifica se a resposta é um Map antes de converter ---
        if (response.data is Map<String, dynamic>) {
          final Map<String, dynamic> data =
              response.data as Map<String, dynamic>;
          final token = data['token'];
          box.write('token', token);

          print("TOKEN LIDO DO STORAGE: $token");

          // Verifica se o token existe antes de decodificar
          if (token != null) {
            Map<String, dynamic> decoded = JwtDecoder.decode(token);
            box.write('email', decoded['email']);
            box.write('id_usuario', decoded['id']);

            id = decoded['id']?.toString() ?? '';
            email = decoded['email']?.toString() ?? '';

          }

          Loading.hide();
          return true;
        } else {
          // Erro se o status é 200, mas o formato de dados é inesperado (ex: String, List)
          Loading.hide();
          await showModalErro(
            context,
            "Sucesso no login, mas o formato de dados retornado pelo servidor é inválido.",
          );
          return false;
        }
      } else {
        Loading.hide();
        String errorMessage;
        if (response.data is Map<String, dynamic>) {
          errorMessage =
              response.data['message']?.toString() ??
              "Erro de login (Resposta Map sem 'message').";
        } else if (response.data is String) {
          errorMessage = response.data;
        } else {
          errorMessage =
              "Erro no login. Formato de resposta inesperado: ${response.data.runtimeType}.";
        }

        await showModalErro(context, errorMessage);
        // ----------------------------------------------------------------------

        return false;
      }
    } catch (e) {
      Loading.hide();
      await showModalErro(context, e.toString());
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 90),
            child: Column(
              // Propriedade 'spacing: 20' removida.
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/images/Logo.png', width: 120, height: 120),
                SizedBox(height: 35),
                SizedBox(
                  width: 350,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _inputLogin,
                          cursorColor: Theme.of(context).colorScheme.secondary,
                          decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xff540F63)),
                            ),
                            labelStyle: TextStyle(color: Color(0xff540F63)),
                            hoverColor: Color(0xff540F63),
                            focusColor: Color(0xff540F63),
                            fillColor: Color(0xff540F63),
                            labelText: 'Email',
                            prefixIcon: const Icon(
                              Icons.person,
                              color: Color(0xff540F63),
                              size: 40,
                            ),
                          ),
                        ),
                        TextFormField(
                          controller: _inputSenha,
                          cursorColor: Theme.of(context).colorScheme.secondary,
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
                              child: Icon(
                                obscureAtivo
                                    ? Icons.visibility_off_outlined
                                    : Icons.remove_red_eye_outlined,
                                color: Color(0xff540F63),
                              ),
                              onTap: () {
                                obscureAtivo = !obscureAtivo;
                                setState(() {});
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 23),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RecuperarSenha(),
                            ),
                          );
                        },
                        child: Text(
                          'Esqueceu a senha?',
                          style: TextStyle(
                            fontSize: 15,
                            color: Color(0xff540F63),
                            fontWeight: FontWeight.bold,
                            fontFamily: GoogleFonts.ubuntu().fontFamily,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.07,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          bool ok = await login();
                          if (ok) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Home()),
                            );
                          }
                        }
                      },
                      child: Text('Entrar'),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // Propriedade 'spacing: 5' removida.
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
                        SizedBox(width: 5), // Espaçamento adicionado
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Cadastroum(),
                              ),
                            );
                          },
                          child: Text(
                            'Cadastre-se',
                            style: TextStyle(
                              fontSize: 15,
                              color: Color(0xff540F63),
                              fontWeight: FontWeight.bold,
                              fontFamily: GoogleFonts.ubuntu().fontFamily,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
