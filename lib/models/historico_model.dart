class Historico {
  final int id;
  final String nomeCarro;
  final double valor;
  final DateTime horaEntrada;
  final DateTime? horaSaida;

  Historico({
    required this.id,
    required this.nomeCarro,
    required this.valor,
    required this.horaEntrada,
    this.horaSaida,
  });

  factory Historico.fromJson(Map<String, dynamic> json) {
    return Historico(
      id: _parseInt(json['id']),
      nomeCarro:
          (json['nome_carro'] ?? json['carro'] ?? json['nome'] ?? '')
              .toString(),
      valor: _parseDouble(
        _firstNonNull([
          json['valor'],
          json['valor_total'],
          json['preco'],
          // caminhos aninhados comuns:
          (json['pagamento'] as Map?)?['valor'],
          (json['cobranca'] as Map?)?['valor'],
          (json['dados'] as Map?)?['valor'],
        ]),
      ),
      horaEntrada: _parseDateTime(json['hora_entrada'] ?? json['entrada']),
      horaSaida: _parseNullableDateTime(json['hora_saida'] ?? json['saida']),
    );
  }

  // ---------- Helpers ----------

  static T? _firstNonNull<T>(List<T?> list) {
    for (final item in list) {
      if (item != null) return item;
    }
    return null;
  }

  static int _parseInt(dynamic v) {
    if (v == null) return 0;
    if (v is int) return v;
    if (v is double) return v.toInt();
    if (v is String) return int.tryParse(v.trim()) ?? 0;
    return 0;
  }

  static double _parseDouble(dynamic v) {
    if (v == null) return 0.0;
    if (v is double) return v;
    if (v is int) return v.toDouble();
    if (v is String) {
      var s = v.trim();
      if (s.isEmpty) return 0.0;

      // Remove símbolo de moeda e espaços
      s = s.replaceAll(RegExp(r'(?i)r\$'), '').trim();

      // Se tiver tanto ponto quanto vírgula, assume ponto como milhar e vírgula como decimal (pt-BR)
      if (s.contains('.') && s.contains(',')) {
        s = s.replaceAll('.', ''); // remove milhares
        s = s.replaceAll(',', '.'); // vírgula -> ponto decimal
      } else if (s.contains(',') && !s.contains('.')) {
        // vírgula como decimal (sem milhar)
        s = s.replaceAll(',', '.');
      }

      // Remove quaisquer caracteres não numéricos (ex.: espaços, NBSP)
      s = s.replaceAll(RegExp(r'[^\d\.\-]'), '');

      return double.tryParse(s) ?? 0.0;
    }
    // Qualquer outro tipo inesperado -> tenta toString
    return double.tryParse(v.toString()) ?? 0.0;
  }

  static DateTime _parseDateTime(dynamic raw) {
    final s = raw?.toString().trim() ?? '';
    if (s.isEmpty) return DateTime.now();
    if (s == '0000-00-00 00:00:00' || s.toLowerCase() == 'null') {
      return DateTime.now();
    }
    final normalized = s.contains(' ') ? s.replaceFirst(' ', 'T') : s;
    try {
      return DateTime.parse(normalized);
    } catch (_) {
      try {
        final withT =
            normalized.contains('T')
                ? normalized
                : normalized.replaceFirst(' ', 'T');
        final fixed = withT.length == 16 ? '$withT:00' : withT;
        return DateTime.parse(fixed);
      } catch (_) {
        return DateTime.now();
      }
    }
  }

  static DateTime? _parseNullableDateTime(dynamic raw) {
    if (raw == null) return null;
    final s = raw.toString().trim();
    if (s.isEmpty || s == '0000-00-00 00:00:00' || s.toLowerCase() == 'null')
      return null;
    try {
      final normalized = s.contains(' ') ? s.replaceFirst(' ', 'T') : s;
      return DateTime.parse(normalized);
    } catch (_) {
      try {
        final withT = s.contains('T') ? s : s.replaceFirst(' ', 'T');
        final fixed = withT.length == 16 ? '$withT:00' : withT;
        return DateTime.parse(fixed);
      } catch (_) {
        return null;
      }
    }
  }
}
