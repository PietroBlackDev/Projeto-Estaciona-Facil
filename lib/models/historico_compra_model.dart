class HistoricoPagamento {
  final int id;
  final int idUsuario;
  final double valor;
  final String formaPagamento;
  final DateTime data;

  HistoricoPagamento({
    required this.id,
    required this.idUsuario,
    required this.valor,
    required this.formaPagamento,
    required this.data,
  });

  factory HistoricoPagamento.fromJson(Map<String, dynamic> json) {
    return HistoricoPagamento(
      id: json['id'] ?? 0,
      idUsuario: json['id_usuario'] ?? 0,
      valor: _parseDouble(json['valor']),
      formaPagamento: json['forma_pagamento']?.toString() ?? '',
      data: _parseDateTime(json['Data']),
    );
  }

  static double _parseDouble(dynamic v) {
    if (v == null) return 0.0;
    if (v is double) return v;
    if (v is int) return v.toDouble();
    if (v is String) {
      var s = v.replaceAll(RegExp(r'[^\d,\.]'), '').trim();
      if (s.contains(',') && !s.contains('.')) {
        s = s.replaceAll(',', '.');
      }
      return double.tryParse(s) ?? 0.0;
    }
    return 0.0;
  }

  static DateTime _parseDateTime(dynamic raw) {
    final s = raw?.toString().trim() ?? '';
    if (s.isEmpty || s == '0000-00-00 00:00:00') return DateTime.now();
    final normalized = s.contains(' ') ? s.replaceFirst(' ', 'T') : s;
    try {
      return DateTime.parse(normalized);
    } catch (_) {
      return DateTime.now();
    }
  }
}
