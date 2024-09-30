import 'package:rx_notifier/rx_notifier.dart';
import 'package:xfood/atoms/home_page_state.dart';
import 'package:xfood/atoms/pedidos_state.dart';
import 'package:xfood/repositories/i_lanche_repository.dart';

import '../infra/i_pedido_api_service.dart';

class PedidosReducers extends RxReducer {
  final PedidosState state;
  final IPedidoApiService api;

  PedidosReducers(this.state, this.api) {
    on(() => [state.fetchList], _fetchList);
  }

  _fetchList() async {
    final lista = await api.listar();
    state.pedidosList.clear();
    state.pedidosList.addAll(lista);
  }
}
