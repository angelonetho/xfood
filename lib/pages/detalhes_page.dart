import 'package:flutter/material.dart';
import 'package:xfood/models/lanche.dart';

class DetalhesPage extends StatelessWidget {

  final Lanche model;

  DetalhesPage({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detalhes"),
      ),
      body: Column(
        children: [
          Container(
            height: 500,
            width: 500,
            child: Hero(
              tag: "lanche",
              child: Image.network(model.urlImagem, fit: BoxFit.fill),
            ),
          ),
          Text(model.nome, style: const TextStyle(color: Colors.amber)),
          Text(model.descricao, style: const TextStyle(color: Colors.amber)),
          Text(model.valorReais, style: const TextStyle(color: Colors.amber)),
        ],
      ),
    );
  }
}