import 'package:flutter/material.dart';
import 'package:xfood/atoms/carrinho_state.dart';
import 'package:xfood/dependencies.dart';
import 'package:xfood/pages/detalhes_page.dart';

import '../models/lanche.dart';

class ProductCard extends StatelessWidget {
  final Lanche model;

  final estadoCarrinho = injector.get<CarrinhoState>();

  ProductCard({super.key, required this.model});

  _abrirDetalhes(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return DetalhesPage(model: model);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return GridTile(
      footer: GridTileBar(
        backgroundColor: Colors.black54,
        title: Center(
          child: Text(model.nome),
        ),
        trailing: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(model.valorReais),
        ),
      ),
      child: GestureDetector(
        onTap: () {
          _abrirDetalhes(context);
        },
        onDoubleTap: () {
          estadoCarrinho.adicionar.setValue(model);
        },
        child: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            border: Border.all(),
          ),
          child: Hero(
            tag: model.id,
            child: Image.network(
              model.urlImagem,
              fit: BoxFit.fill,
            ),
          )
        ),
      ),
    );
  }
}
