import 'dart:io';

class Item {
  final int _id;
  final String _dataRecebido;
  final String _dataEntregue;
  final String _descricao;


  Item(
      this._id,
      this._dataRecebido,
      this._dataEntregue,
      this._descricao,);

  Item.fromJson(Map<String, dynamic> json)
      : _id = json['id'],
        _dataRecebido = json['dataRecebido'],
        _dataEntregue = json['dataEntregue'],
        _descricao = json['descricao'];

  Map<String, dynamic> toJson() => {
        'id': _id,
        'dataRecebido': _dataRecebido,
        'dataEntregue': _dataEntregue,
        'descricao': _descricao,
      };

  int get id => _id;
  String get dataRecebido => _dataRecebido;
  String get dataEntregue => _dataEntregue;
  String get descricao => _descricao;

  void printData() {
    stdout.write("\n\nID: $_id\n");
    stdout.write("Data_Recebido: $_dataRecebido\n");
    stdout.write("Data_Entregue: $_dataEntregue\n");
    stdout.write("Descricao: $_descricao\n\n");
  }
}
