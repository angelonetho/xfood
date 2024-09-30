import 'package:flutter/material.dart';

import '../models/pedido.dart';

class DetalhesPedidoPage extends StatelessWidget {

  final Pedido model;

  DetalhesPedidoPage({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detalhes"),
      ),
      body: Center(
        child: Column(
        children: [
          Text("ID do pedido: ${model.id}", style: const TextStyle(color: Colors.grey)),
          Text("Pedido realizado no dia ${model.dataHora.day}/${model.dataHora.month}/${model.dataHora.year} ás ${model.dataHora.hour}:${model.dataHora.minute}", style: const TextStyle(color: Colors.white)),
          Text("Lanches: ${model.lanches.toString()}", style: const TextStyle(color: Colors.white)),
          Text("Valor total do pedido: R\$${model.getValorTotal()}", style: const TextStyle(color: Colors.green)),
        ],
      ),
    )
    );
  }
}