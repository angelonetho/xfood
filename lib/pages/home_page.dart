import 'package:flutter/material.dart';
import 'package:rx_notifier/rx_notifier.dart';
import 'package:xfood/atoms/carrinho_state.dart';
import 'package:xfood/atoms/home_page_state.dart';
import 'package:xfood/dependencies.dart';
import 'package:xfood/pages/pedidos_page.dart';
import 'package:xfood/widgets/product_card.dart';

import '../widgets/gaveta.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final state = injector.get<HomePageState>();
  final carrinhoState = injector.get<CarrinhoState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    state.fetchList();

    carrinhoState.mensagem.addListener(() {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(carrinhoState.mensagem.value)));
      scaffoldKey.currentState!.closeDrawer();
    });
  }

  _abrirPedidos(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return PedidosPage();
    }));
  }

  @override
  Widget build(BuildContext context) {
    context.select(() => [state.lanchesList.length]);

    return Scaffold(
        appBar: AppBar(
          title: const Text("XFood"),
          centerTitle: true,
          backgroundColor: Colors.red,
          actions: [
            IconButton(onPressed: () {_abrirPedidos(context);},
        icon: const Icon(Icons.receipt_long),
            )
          ]
        ),
        drawer: Gaveta(),
        body: Stack(
          children: [
            GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                itemBuilder: (_, index) {
                  final model = state.lanchesList[index];
                  return ProductCard(model: model);
                },
            itemCount: state.lanchesList.length,)
          ],
        ));
  }
}
