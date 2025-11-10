class UsuarioModel {
  int? id;
  String? nome;
  String? email;
  String? telefone;
  String? cPF;
  String? senha;
  String? formaPagamento;
  int? saldo;

  UsuarioModel({
    this.id,
    this.nome,
    this.email,
    this.telefone,
    this.cPF,
    this.senha,
    this.formaPagamento,
    this.saldo,
  });

  UsuarioModel.fromJson(Map<String, dynamic> json) {
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
