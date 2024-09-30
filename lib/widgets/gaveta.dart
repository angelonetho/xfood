import 'package:flutter/material.dart';
import 'package:rx_notifier/rx_notifier.dart';
import 'package:xfood/atoms/carrinho_state.dart';
import 'package:xfood/dependencies.dart';

class Gaveta extends StatelessWidget {
  final estado = injector.get<CarrinhoState>();

  Gaveta({super.key});

  @override
  Widget build(BuildContext context) {
    context.select(() => [estado.carrinho.length]);
    return Drawer(
      child: Column(
        children: [
          const Text("XFood"),
          const Divider(),
          Expanded(child: ListView.builder(itemBuilder: (_, index) {
            final lanche = estado.carrinho[index];
            return ListTile(
              leading: Container(
                child: ClipOval(
                  child: Image.network(lanche.urlImagem),
                ),
                height: 40,
                  width: 40,
              ),
              title: Text("${lanche.nome}"),
              subtitle: Text("R\$${lanche.valor}"),
            );
          }, itemCount: estado.carrinho.length)),
          Divider(),
          Text("Valor total R\$${estado.total.toStringAsFixed(2)}"),
          Stack(
            alignment: Alignment.center,
            children: [
              ElevatedButton(onPressed: () {
                estado.finalizar.call();
              },
                  child: Text("Finalizar Pedido")),
              if(estado.processando.value)
                Container(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(),
                )
            ]
          ),
          ElevatedButton(onPressed: () {
            estado.limpar.call();
          }, child: Text("Limpar carrinho"))
        ],
      ),
    );
  }


}