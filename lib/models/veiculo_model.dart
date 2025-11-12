class VeiculoModel {
  int? id;
  String? nomeCarro;
  String? placa;
  String? categoria;
  String? placaPadrao;
  int? idUsuario;

  VeiculoModel({
    this.id,
    this.nomeCarro,
    this.placa,
    this.categoria,
    this.placaPadrao,
    this.idUsuario,
  });

  VeiculoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nomeCarro = json['nome_carro'];
    placa = json['placa'];
    categoria = json['categoria'];
    placaPadrao = json['padrao_placa'];
    idUsuario = json['id_usuario'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome_carro'] = this.nomeCarro;
    data['placa'] = this.placa;
    data['categoria'] = this.categoria;
    data['padrao_placa'] = this.placaPadrao;
    data['id_usuario'] = this.idUsuario;
    return data;
  }
}
