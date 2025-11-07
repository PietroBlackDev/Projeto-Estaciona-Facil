import 'package:dio/dio.dart';
import 'package:estaciona_facil/models/usuario_model.dart';


class NetworkException implements Exception {
  final String message;
  NetworkException(this.message);
  @override
  String toString() => 'NetworkException: $message';
}

class ApiException implements Exception {
  final String message;
  ApiException(this.message);
  @override
  String toString() => 'ApiException: $message';
}

class UserService {
  // Base URL da API. Idealmente, deve ser configurada em um arquivo de constantes ou env
  static const String _baseUrl = "http://10.17.16.61/Projeto-Estaciona-Facil-API/"; 
  
  // Usamos o Dio injetado. Ele deve ser configurado com BaseOptions na inicialização
  final Dio _dioClient; 

  UserService(this._dioClient);

  Future<UsuarioModel> getUserData(int idUsuario) async {
    const String endpoint = "/usuarios"; // Ajuste o endpoint conforme sua API
    String url = "$_baseUrl$endpoint/$idUsuario";

    try {
      // 1. Faz a requisição usando o _dioClient
      final response = await _dioClient.get(url);
      
      // 2. Trata o status code HTTP
      if (response.statusCode == 200) {
        // Sucesso: Mapeia o JSON para o UsuarioModel
        final Map<String, dynamic> data = response.data;

        // Se o JSON estiver aninhado (ex: {"user": {...}}), ajuste aqui
        // return UsuarioModel.fromJson(data['user']); 
        
        print("Dados do Usuário recebidos: $data");
        return UsuarioModel.fromJson(data); 

      } else {
        // Status code indica erro do lado da API (ex: 400, 404, 401)
        final String errorMessage = response.data?['message'] ?? 'Falha ao buscar usuário. Status: ${response.statusCode}';
        throw ApiException(errorMessage);
      }
    } on DioException catch (e) {
      // Erro de rede, timeout, ou erro do servidor (ex: 500)
      if (e.type == DioExceptionType.connectionTimeout || 
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.sendTimeout) {
        throw NetworkException("Timeout de conexão. Verifique sua rede.");
      } else if (e.response != null) {
        // Erro com resposta HTTP (ex: 404, 500)
        final String errorMessage = e.response!.data?['message'] ?? 'Erro no servidor: ${e.response!.statusCode}';
        throw ApiException(errorMessage);
      } else {
        // Outros erros de Dio
        throw NetworkException("Erro de rede desconhecido: ${e.message}");
      }
    } catch (e) {
      // Captura outros erros inesperados (ex: erro no parsing do JSON)
      print("Erro inesperado: $e");
      throw NetworkException("Ocorreu um erro inesperado ao processar os dados.");
    }
  }
}