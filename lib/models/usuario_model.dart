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
    nome = json['Nome'];
    email = json['Email'];
    telefone = json['Telefone'];
    cPF = json['CPF'];
    senha = json['Senha'];
    formaPagamento = json['FormaPagamento'];
    saldo = json['saldo'];
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();


    data['Nome'] = this.nome;
    data['Email'] = this.email;
    data['Telefone'] = this.telefone;
    data['CPF'] = this.cPF; // 
    data['Senha'] = this.senha;
    data['FormaPagamento'] = this.formaPagamento;


    return data;
  }

}