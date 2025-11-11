import 'package:dio/dio.dart';
import 'package:estaciona_facil/components/modal_confirmacao.dart';
import 'package:estaciona_facil/components/widget_label.dart';
import 'package:estaciona_facil/pages/Fluxo_Manu/fluxo_login/efetuar_login.dart';
import 'package:flutter/material.dart';

class MinhaContaDois extends StatefulWidget {
  const MinhaContaDois({super.key});

  @override
  State<MinhaContaDois> createState() => _MinhaContaDoisState();
}

class _MinhaContaDoisState extends State<MinhaContaDois> {
  final _formKey = GlobalKey<FormState>();

  bool _obscureSenha = true;
  bool _obscureConfirmaSenha = true;
  bool _isLoading = false;
  final token = box.read('token');

  final _senhaAtualController = TextEditingController();
  final _senhaController = TextEditingController();
  final _confirmaSenhaController = TextEditingController();

  void quandoEditaSenha() async {
    final dio = Dio();
    int id = box.read('id_usuario');
    var url =
        'http://10.125.121.135:8081/Projeto-Estaciona-Facil-API/usuarios/senha/$id';

    var data = {
      'senha': _senhaAtualController.text,
      'senhaNova': _senhaController.text,
    };

    try {
      final response = await dio.patch(
        url,
        data: data,
        options: Options(
          contentType:
              Headers
                  .formUrlEncodedContentType, // Define como x-www-form-urlencoded
          headers: {"Authorization": "Bearer $token"},
        ),
      );

      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.green,
          content: Text('Senha alterada com sucesso!'),
        ),
      );
      setState(() {});
      print('Resposta: ${response.data}');
    } catch (e) {
      print('Erro ao enviar: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                WidgetLabel(texto: 'Minha Conta'),
                const SizedBox(height: 35),
                Container(
                  width: MediaQuery.of(context).size.width * 1,
                  height: MediaQuery.of(context).size.height * 0.005,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onPrimary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                const SizedBox(height: 30),
                Text(
                  'Alterar senha',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 30),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Column(
                          spacing: 56,
                          children: [
                            Icon(Icons.lock, color: Colors.black, size: 25),
                            Icon(Icons.lock, color: Colors.black, size: 25),
                            Icon(Icons.lock, color: Colors.black, size: 25),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      Center(
                        child: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: 20,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.72,
                                height:
                                    MediaQuery.of(context).size.height * 0.07,
                                child: TextFormField(
                                  controller: _senhaAtualController,
                                  decoration: InputDecoration(
                                    hintText: 'Senha atual',
                                    hintStyle: TextStyle(
                                      color: Color.fromARGB(255, 42, 42, 42),
                                      fontSize: 17,
                                      fontWeight: FontWeight.w300,
                                      fontFamily: 'Arsenal',
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                    contentPadding: const EdgeInsets.fromLTRB(
                                      13,
                                      0,
                                      13,
                                      0,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: const Color.fromARGB(
                                          141,
                                          158,
                                          158,
                                          158,
                                        ),
                                      ),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'A senha é obrigatória';
                                    }
                                    if (value.length < 3) {
                                      // Validação API
                                      return 'Insira uma senha com pelo menos três caracteres';
                                    }
                                    return null;
                                  },
                                ),
                              ),

                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.72,
                                height:
                                    MediaQuery.of(context).size.height * 0.07,
                                child: TextFormField(
                                  controller: _senhaController,
                                  obscureText: _obscureSenha,
                                  decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        _obscureSenha
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                      ),
                                      onPressed:
                                          () => setState(
                                            () =>
                                                _obscureSenha = !_obscureSenha,
                                          ),
                                    ),
                                    hintText: 'Nova senha',
                                    hintStyle: TextStyle(
                                      color: Color.fromARGB(255, 42, 42, 42),
                                      fontSize: 17,
                                      fontWeight: FontWeight.w300,
                                      fontFamily: 'Arsenal',
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                    contentPadding: const EdgeInsets.fromLTRB(
                                      13,
                                      0,
                                      13,
                                      0,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: const Color.fromARGB(
                                          141,
                                          158,
                                          158,
                                          158,
                                        ),
                                      ),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'A senha é obrigatória';
                                    }
                                    if (value.length < 3) {
                                      // Validação API
                                      return 'Insira uma senha com pelo menos três caracteres';
                                    }
                                    return null;
                                  },
                                ),
                              ),

                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.72,
                                height:
                                    MediaQuery.of(context).size.height * 0.07,
                                child: TextFormField(
                                  controller: _confirmaSenhaController,
                                  obscureText: _obscureConfirmaSenha,
                                  decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        _obscureConfirmaSenha
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                      ),
                                      onPressed:
                                          () => setState(
                                            () =>
                                                _obscureConfirmaSenha =
                                                    !_obscureConfirmaSenha,
                                          ),
                                    ),
                                    hintText: 'Confirme a nova senha',
                                    hintStyle: TextStyle(
                                      color: Color.fromARGB(255, 42, 42, 42),
                                      fontSize: 17,
                                      fontWeight: FontWeight.w300,
                                      fontFamily: 'Arsenal',
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                    contentPadding: const EdgeInsets.fromLTRB(
                                      13,
                                      0,
                                      13,
                                      0,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: const Color.fromARGB(
                                          141,
                                          158,
                                          158,
                                          158,
                                        ),
                                      ),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value != _senhaController.text) {
                                      return 'As senhas não coincidem';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.07,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        _isLoading ? null : quandoEditaSenha();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child:
                        _isLoading
                            ? const SizedBox(
                              width: 24,
                              height: 24,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 3,
                              ),
                            )
                            : const Text(
                              'SALVAR',
                              style: TextStyle(fontSize: 18),
                            ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.height * 0.34,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
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
    );
  }
}
