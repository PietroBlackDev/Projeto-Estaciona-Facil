class UsuarioModel {
  UsuRio? usuRio;

  UsuarioModel({this.usuRio});

  UsuarioModel.fromJson(Map<String, dynamic> json) {
    usuRio =
        json['Usuário'] != null ? new UsuRio.fromJson(json['Usuário']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.usuRio != null) {
      data['Usuário'] = this.usuRio!.toJson();
    }
    return data;
  }
}

class UsuRio {
  String? id;
  String? nome;
  String? email;
  String? telefone;
  String? cPF;
  String? senha;
  String? formaPagamento;
  String? saldo;

  UsuRio(
      {this.id,
      this.nome,
      this.email,
      this.telefone,
      this.cPF,
      this.senha,
      this.formaPagamento,
      this.saldo});

  UsuRio.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    email = json['email'];
    telefone = json['telefone'];
    cPF = json['CPF'];
    senha = json['senha'];
    formaPagamento = json['forma_pagamento'];
    saldo = json['saldo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['email'] = this.email;
    data['telefone'] = this.telefone;
    data['CPF'] = this.cPF;
    data['senha'] = this.senha;
    data['forma_pagamento'] = this.formaPagamento;
    data['saldo'] = this.saldo;
    return data;
  }
}
