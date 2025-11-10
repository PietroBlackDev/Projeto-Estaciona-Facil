import 'package:estaciona_facil/pages/Fluxo_Manu/fluxo_login/efetuar_login.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import '../../models/historico_compra_model.dart';

class HistoricoTres extends StatefulWidget {
  const HistoricoTres({super.key});

  @override
  State<HistoricoTres> createState() => _HistoricoTresState();
}

class _HistoricoTresState extends State<HistoricoTres> {
  late final String token;
  late final Dio _dio;
  int idUsuario = box.read('id_usuario');
  late Future<List<HistoricoPagamento>> _future;

  final _currency = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');
  final _date = DateFormat('dd/MM/yyyy HH:mm');

  @override
  void initState() {
    super.initState();
    // ajuste conforme você guarda o token
    token = box.read('token');

    _dio = Dio(
      BaseOptions(
        baseUrl: 'http://10.125.121.135:8081/Projeto-Estaciona-Facil-API/',
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 15),
        headers: {"Authorization": "Bearer $token"},
      ),
    );

    _future = _fetchPagamentos();
  }

  Future<List<HistoricoPagamento>> _fetchPagamentos() async {
    try {
      final res = await _dio.get('pagamentos/$idUsuario');
      final data = res.data;

      if (data is Map) {
        final list =
            (data['historicos'] is List)
                ? data['historicos'] as List
                : const [];
        return list
            .where((e) => e is Map)
            .map(
              (e) => HistoricoPagamento.fromJson(
                Map<String, dynamic>.from(e as Map),
              ),
            )
            .toList();
      }
      if (data is List) {
        return data
            .where((e) => e is Map)
            .map(
              (e) => HistoricoPagamento.fromJson(
                Map<String, dynamic>.from(e as Map),
              ),
            )
            .toList();
      }
      return const <HistoricoPagamento>[];
    } on DioException catch (e) {
      final code = e.response?.statusCode;
      if (code == 404 || code == 204) {
        return const <HistoricoPagamento>[];
      }
      rethrow;
    }
  }

  // ✅ Corrigido para não retornar Future dentro do setState
  Future<void> _refresh() async {
    final future = _fetchPagamentos();
    if (!mounted) return;
    setState(() {
      _future = future;
    });
    await future;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Histórico de Pagamentos')),
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: FutureBuilder<List<HistoricoPagamento>>(
          future: _future,
          builder: (context, snapshot) {
            // Loading
            if (snapshot.connectionState == ConnectionState.waiting) {
              return ListView.separated(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.all(12),
                itemCount: 6,
                separatorBuilder: (_, __) => const SizedBox(height: 8),
                itemBuilder: (_, __) => const _LoadingTile(),
              );
            }

            // Erro
            if (snapshot.hasError) {
              return ListView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.all(24),
                children: [
                  Icon(
                    Icons.wifi_off,
                    size: 48,
                    color: Theme.of(context).colorScheme.error,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Erro ao carregar:\n${snapshot.error}',
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  Center(
                    child: FilledButton.icon(
                      onPressed: _refresh,
                      icon: const Icon(Icons.refresh),
                      label: const Text('Tentar novamente'),
                    ),
                  ),
                ],
              );
            }

            final itens = snapshot.data ?? const <HistoricoPagamento>[];
            // Vazio
            if (itens.isEmpty) {
              return ListView(
                physics: const AlwaysScrollableScrollPhysics(),
                children: const [
                  SizedBox(height: 120),
                  Center(child: Text('Nenhum pagamento encontrado')),
                ],
              );
            }
            // Sucesso
            return ListView.separated(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.all(12),
              itemCount: itens.length,
              separatorBuilder: (_, __) => const SizedBox(height: 8),
              itemBuilder: (context, index) {
                final p = itens[index];
                final quando = _date.format(p.data);
                final valorFmt = _currency.format(p.valor);

                return Card(
                  child: ListTile(
                    leading: const CircleAvatar(child: Icon(Icons.payments)),
                    title: Text(
                      valorFmt,
                      style: const TextStyle(fontWeight: FontWeight.w700),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Forma: ${p.formaPagamento}'),
                        Text('Data:  $quando'),
                      ],
                    ),
                    // onTap: () { ... } // se quiser detalhar
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class _LoadingTile extends StatelessWidget {
  const _LoadingTile();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const CircleAvatar(backgroundColor: Colors.black12),
        title: Container(
          height: 12,
          color: Colors.black12,
          margin: const EdgeInsets.symmetric(vertical: 6),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 10,
              color: Colors.black12,
              margin: const EdgeInsets.only(bottom: 6, right: 60),
            ),
            Container(
              height: 10,
              color: Colors.black12,
              margin: const EdgeInsets.only(bottom: 8, right: 100),
            ),
          ],
        ),
        trailing: Container(width: 48, height: 16, color: Colors.black12),
      ),
    );
  }
}
