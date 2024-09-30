import 'package:flutter/material.dart';
import 'package:rx_notifier/rx_notifier.dart';
import 'package:xfood/atoms/pedidos_state.dart';
import 'package:xfood/dependencies.dart';
import 'package:xfood/models/lanche.dart';
import 'package:xfood/pages/detalhes_pedido_page.dart';
import 'package:xfood/widgets/pedido_card.dart';

class PedidosPage extends StatefulWidget {

  PedidosPage({super.key});

  @override
  State<PedidosPage> createState() => _PedidosPageState();
}

class _PedidosPageState extends State<PedidosPage> {
  final pedidosState = injector.get<PedidosState>();

  @override
  void initState() {
    super.initState();
    pedidosState.fetchList();
  }

  _abrirDetalhes(BuildContext context, model) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return DetalhesPedidoPage(model: model);
    }));
  }

  @override
  Widget build(BuildContext context) {
    context.select(() => [pedidosState.pedidosList.length]);
    return Scaffold(
        appBar: AppBar(
          title: const Text("Lista de Pedidos"),
        ),
        body: Stack(
          children: [
            GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5),
                itemBuilder: (_, index) {
                  final model = pedidosState.pedidosList[index];
                  return PedidoCard(model: model);
                },
                itemCount: pedidosState.pedidosList.length),
            Text("Número de pedidos: ${pedidosState.pedidosList.length.toString()}"),
          ],
        ));
  }
}
