import 'package:flutter/material.dart';
import 'package:xfood/atoms/carrinho_state.dart';
import 'package:xfood/dependencies.dart';
import 'package:xfood/models/pedido.dart';
import 'package:xfood/pages/detalhes_page.dart';
import 'package:xfood/pages/detalhes_pedido_page.dart';

import '../models/lanche.dart';

class PedidoCard extends StatelessWidget {
  final Pedido model;

  final estadoCarrinho = injector.get<CarrinhoState>();

  PedidoCard({super.key, required this.model});

  _abrirDetalhes(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return DetalhesPedidoPage(model: model);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return GridTile(
      footer: GridTileBar(
        backgroundColor: Colors.black54,
        title: Center(
          child: Text("Pedido realizado há ${DateTime.now().difference(model.dataHora).inMinutes.toString()} minutos"),
        ),
      ),
      child: GestureDetector(
        onTap: () {
          _abrirDetalhes(context);
        },
        child: Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              border: Border.all(),
            ),
            child: Hero(
              tag: model.id,
              child: Image.network(
                model.lanches[0].urlImagem,
                fit: BoxFit.fill,
              ),
            )
        ),
      ),
    );
  }
}
