import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:estaciona_facil/models/usuario_model.dart'; 

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final _formKey = GlobalKey<FormState>();


  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _telefoneController = TextEditingController();
  final _cpfController = TextEditingController();
  final _formaPagamentoController = TextEditingController();
  final _senhaController = TextEditingController();
  final _confirmaSenhaController = TextEditingController();

  final Dio _dio = Dio();
  bool _isLoading = false;
  bool _obscureSenha = true;
  bool _obscureConfirmaSenha = true;

  @override
  void dispose() {
    _nomeController.dispose();
    _emailController.dispose();
    _telefoneController.dispose();
    _cpfController.dispose();
    _formaPagamentoController.dispose();
    _senhaController.dispose();
    _confirmaSenhaController.dispose();
    super.dispose();
  }

  Future<void> _submitForm() async {
    if (!(_formKey.currentState?.validate() ?? false)) {
      return;
    }

    setState(() => _isLoading = true);

    //UsuarioModel
    

    final formData = FormData.fromMap({
        'Nome': _nomeController.text,
        'Email': _emailController.text,
        'Telefone': _telefoneController.text,
        'CPF': _cpfController.text,
        'Senha': _senhaController.text,
        'FormaPagamento': _formaPagamentoController.text,
      });

    try {
      final response = await _dio.post(
        'http://192.168.100.8/Projeto-Estaciona-F-cil-API/usuarios',

        data: formData,
      );

      if (response.statusCode == 201) { // 201 (Created)
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.green,
            content: Text('Usuário cadastrado com sucesso!'),
          ),
          
        );
        Navigator.pop(context);

      } else {
        _showError('Erro no servidor: ${response.statusCode}');
      }
    } on DioException catch (e) {
      String errorMessage = 'Não foi possível completar o cadastro.';
      

      if (e.response?.statusCode == 400) {

        errorMessage = e.response?.data['message'] ?? 'Usuário já existente.';
      } 

      else if (e.response?.statusCode == 406) {
        errorMessage = e.response?.data['message'] ?? 'Dados inválidos.';
      }
      else if (e.type == DioExceptionType.connectionTimeout || e.type == DioExceptionType.connectionError) {
        errorMessage = 'Erro de conexão. Verifique sua internet.';
      }
      _showError(errorMessage);
    } catch (e) {
      _showError('Ocorreu um erro inesperado: $e');
    } finally {
      setState(() => _isLoading = false);
    }
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        content: Text(message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Criar Conta'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // --- CAMPO NOME ---
                TextFormField(
                  controller: _nomeController,
                  decoration: const InputDecoration(
                    labelText: 'Nome Completo',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                  ),
                  validator: (value) { /* ... (validação do nome) ... */ },
                ),
                const SizedBox(height: 16),

                // --- CAMPO E-MAIL ---
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'E-mail',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) { /* ... (validação do email) ... */ },
                ),
                const SizedBox(height: 16),

                // --- CAMPO TELEFONE ---
                TextFormField(
                  controller: _telefoneController,
                  decoration: const InputDecoration(
                    labelText: 'Telefone (com DDD)',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.phone),
                  ),
                  keyboardType: TextInputType.phone,
                  validator: (value) { /* ... (validação do telefone) ... */ },
                ),
                const SizedBox(height: 16),

                // --- CAMPO CPF ---
                TextFormField(
                  controller: _cpfController,
                  decoration: const InputDecoration(
                    labelText: 'CPF (só números)',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.badge),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'O CPF é obrigatório';
                    }
                    if (value.length != 11) { // Validação da sua API
                      return 'O cpf deve possuir 11 dígitos';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                TextFormField(
                  controller: _formaPagamentoController,
                  decoration: const InputDecoration(
                    labelText: 'Forma de Pagamento (ex: PIX)',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.payment),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      // Validação da sua API
                      return 'O campo de formas de pagamento é obrigatório!';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // --- CAMPO SENHA ---
                TextFormField(
                  controller: _senhaController,
                  obscureText: _obscureSenha,
                  decoration: InputDecoration(
                    labelText: 'Senha',
                    border: const OutlineInputBorder(),
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(_obscureSenha ? Icons.visibility_off : Icons.visibility),
                      onPressed: () => setState(() => _obscureSenha = !_obscureSenha),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'A senha é obrigatória';
                    }
                    if (value.length < 3) { // Validação API
                      return 'Insira uma senha com pelo menos três caracteres';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                //CONFIRMAR SENHA
                TextFormField(
                  controller: _confirmaSenhaController,
                  obscureText: _obscureConfirmaSenha,
                  decoration: InputDecoration(
                    labelText: 'Confirmar Senha',
                    border: const OutlineInputBorder(),
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: IconButton(
                      icon: Icon(_obscureConfirmaSenha ? Icons.visibility_off : Icons.visibility),
                      onPressed: () => setState(() => _obscureConfirmaSenha = !_obscureConfirmaSenha),
                    ),
                  ),
                  validator: (value) {
                    if (value != _senhaController.text) {
                      return 'As senhas não coincidem';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 30),

                // --- BOTÃO CADASTRAR (com loading) ---
                ElevatedButton(
                  onPressed: _isLoading ? null : _submitForm,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: _isLoading
                      ? const SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 3,
                          ),
                        )
                      : const Text('Cadastrar', style: TextStyle(fontSize: 18)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
