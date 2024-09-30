import 'dart:convert';

import 'package:flutter/foundation.dart';

import './lanche.dart';

class Pedido {
  final String id;
  final List<Lanche> lanches;
  final DateTime dataHora;

  Pedido({
    required this.id,
    required this.lanches,
    required this.dataHora,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'lanches': lanches.map((x) => x.toMap()).toList(),
      'dataHora': dataHora.millisecondsSinceEpoch,
    };
  }

  Pedido copyWith({
    String? id,
    List<Lanche>? lanches,
    DateTime? dataHora,
  }) {
    return Pedido(
      id: id ?? this.id,
      lanches: lanches ?? this.lanches,
      dataHora: dataHora ?? this.dataHora,
    );
  }

  factory Pedido.fromMap(Map<String, dynamic> map) {
    return Pedido(
      id: map['id'] ?? '',
      lanches: List<Lanche>.from(map['lanches']?.map((x) => Lanche.fromMap(x))),
      dataHora: DateTime.fromMillisecondsSinceEpoch(map['dataHora']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Pedido.fromJson(String source) => Pedido.fromMap(json.decode(source));

  @override
  String toString() =>
      'Pedido(id: $id, lanches: $lanches, dataHora: $dataHora)';

  double getValorTotal() {
    double total = 0;

    for (var lanche in lanches) {total += lanche.valor;}

    return total;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Pedido &&
        other.id == id &&
        listEquals(other.lanches, lanches) &&
        other.dataHora == dataHora;
  }

  @override
  int get hashCode => id.hashCode ^ lanches.hashCode ^ dataHora.hashCode;
}
