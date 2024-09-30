import 'dart:convert';

class Lanche {
  final String id;
  final String nome;
  final String descricao;
  final double valor;
  final String urlImagem;

  String get valorReais => "R\$${valor.toStringAsFixed(2)}";

  Lanche({
    required this.id,
    required this.nome,
    required this.descricao,
    required this.valor,
    required this.urlImagem,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'descricao': descricao,
      'valor': valor,
      'urlImagem': urlImagem,
    };
  }

  factory Lanche.fromMap(Map<String, dynamic> map) {
    return Lanche(
      id: map['id'] ?? '',
      nome: map['nome'] ?? '',
      descricao: map['descricao'] ?? '',
      valor: map['valor']?.toDouble() ?? 0.0,
      urlImagem: map['urlImagem'] ?? '',
    );
  }

  @override
  String toString() =>
      '$nome - $valorReais';

  String toJson() => json.encode(toMap());

  factory Lanche.fromJson(String source) => Lanche.fromMap(json.decode(source));
}
