import 'package:dio/dio.dart';
import 'package:estaciona_facil/pages/Fluxo_Manu/fluxo_login/efetuar_login.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../models/historico_model.dart';

class HistoricoDois extends StatefulWidget {
  const HistoricoDois({super.key});

  @override
  State<HistoricoDois> createState() => _HistoricoDoisState();
}

class _HistoricoDoisState extends State<HistoricoDois> {
  late final String token;
  late final Dio _dio;
  int idUsuario = box.read('id_usuario');
  late Future<List<Historico>> _future;

  @override
  void initState() {
    super.initState();
    token = box.read('token');
    _dio = Dio(
      BaseOptions(
        baseUrl: 'http://10.125.121.135:8081/Projeto-Estaciona-Facil-API/',
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 15),
        headers: {"Authorization": "Bearer $token"},
      ),
    );
    _future = _fetchHistorico();
  }

  final _currency = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');
  final _date = DateFormat('dd/MM/yyyy HH:mm');

  Future<List<Historico>> _fetchHistorico() async {
    try {
      final res = await _dio.get('historico/$idUsuario');

      // Se chegou aqui, status está OK (200..299)
      final data = res.data;
      if (data is Map) {
        final list =
            (data['historicos'] is List)
                ? data['historicos'] as List
                : const [];
        return list
            .where((e) => e is Map)
            .map((e) => Historico.fromJson(Map<String, dynamic>.from(e as Map)))
            .toList();
      }
      if (data is List) {
        return data
            .where((e) => e is Map)
            .map((e) => Historico.fromJson(Map<String, dynamic>.from(e as Map)))
            .toList();
      }
      return const <Historico>[];
    } on DioException catch (e) {
      final code = e.response?.statusCode;

      // 🔹 Trate 404/204 como "sem registros"
      if (code == 404 || code == 204) {
        return const <Historico>[];
      }

      // 🔹 Outras faixas de erro: repropaga para a UI de erro
      rethrow;
    }
  }

  Future<void> _refresh() async {
    // Dispara a chamada
    final future = _fetchHistorico();

    // Atualiza o estado de forma síncrona, sem retornar Future dentro do setState
    if (mounted) {
      setState(() {
        _future = future;
      });
    }

    // Aguarda a conclusão para que o RefreshIndicator saiba quando parar
    await future;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Histórico')),
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: FutureBuilder<List<Historico>>(
          future: _future,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const _LoadingListSkeleton(); // shimmer simples
            }
            if (snapshot.hasError) {
              return _ErrorView(error: snapshot.error, onRetry: _refresh);
            }
            final items = snapshot.data ?? const <Historico>[];
            if (items.isEmpty) {
              return const _EmptyView();
            }

            return ListView.separated(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.all(12),
              itemCount: items.length,
              separatorBuilder: (_, __) => const SizedBox(height: 8),
              itemBuilder: (context, index) {
                final h = items[index];
                final entrada = _date.format(h.horaEntrada);
                final saida =
                    h.horaSaida != null
                        ? _date.format(h.horaSaida!)
                        : 'Ainda estacionado';

                final valor = _currency.format(h.valor);

                return Card(
                  child: ListTile(
                    leading: const CircleAvatar(
                      child: Icon(Icons.directions_car),
                    ),
                    title: Text(
                      h.nomeCarro,
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    subtitle: Column(
                      spacing: 5,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Entrada: $entrada',
                          style: TextStyle(fontSize: 16),
                        ),

                        Text('Saída: $saida', style: TextStyle(fontSize: 16)),

                        Text(
                          valor,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
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

// === Widgets auxiliares (opcionais) ===
class _EmptyView extends StatelessWidget {
  const _EmptyView();

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const AlwaysScrollableScrollPhysics(),
      children: const [
        SizedBox(height: 120),
        Center(child: Text('Nenhum histórico encontrado')),
      ],
    );
    // (ListView para permitir pull-to-refresh mesmo vazio)
  }
}

class _ErrorView extends StatelessWidget {
  final Object? error;
  final VoidCallback onRetry;

  const _ErrorView({required this.error, required this.onRetry, Key? key})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    final message =
        error is DioException
            ? (error as DioException).message
            : error?.toString() ?? 'Erro desconhecido';
    return ListView(
      physics: const AlwaysScrollableScrollPhysics(),
      children: [
        const SizedBox(height: 120),
        Icon(
          Icons.wifi_off,
          size: 48,
          color: Theme.of(context).colorScheme.error,
        ),
        const SizedBox(height: 12),
        Center(
          child: Text(
            'Erro ao carregar:\n$message',
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 12),
        Center(
          child: FilledButton.icon(
            onPressed: onRetry,
            icon: const Icon(Icons.refresh),
            label: const Text('Tentar novamente'),
          ),
        ),
      ],
    );
  }
}

class _LoadingListSkeleton extends StatelessWidget {
  const _LoadingListSkeleton();

  @override
  Widget build(BuildContext context) {
    // Placeholder simples para loading
    return ListView.separated(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.all(12),
      itemCount: 6,
      separatorBuilder: (_, __) => const SizedBox(height: 8),
      itemBuilder: (_, __) {
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
      },
    );
  }
}
