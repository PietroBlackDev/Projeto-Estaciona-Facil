class MultasModel {
  List<Multas>? multas;

  MultasModel({this.multas});

  MultasModel.fromJson(Map<String, dynamic> json) {
    if (json['Multas'] != null) {
      multas = <Multas>[];
      json['Multas'].forEach((v) {
        multas!.add(new Multas.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.multas != null) {
      data['Multas'] = this.multas!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Multas {
  String? nomeCarro;
  String? placa;
  String? valor;
  String? dtCriacao;
  String? regularizacao;
  String? status;
  String? nome;

  Multas(
      {this.nomeCarro,
      this.placa,
      this.valor,
      this.dtCriacao,
      this.regularizacao,
      this.status,
      this.nome});

  Multas.fromJson(Map<String, dynamic> json) {
    nomeCarro = json['nome_carro'];
    placa = json['placa'];
    valor = json['valor'];
    dtCriacao = json['dt_criacao'];
    regularizacao = json['regularizacao'];
    status = json['status'];
    nome = json['nome'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome_carro'] = this.nomeCarro;
    data['placa'] = this.placa;
    data['valor'] = this.valor;
    data['dt_criacao'] = this.dtCriacao;
    data['regularizacao'] = this.regularizacao;
    data['status'] = this.status;
    data['nome'] = this.nome;
    return data;
  }
}
