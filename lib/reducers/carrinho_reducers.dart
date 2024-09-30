import 'package:rx_notifier/rx_notifier.dart';
import 'package:xfood/atoms/carrinho_state.dart';
import 'package:xfood/infra/i_pedido_api_service.dart';
import 'package:xfood/models/pedido.dart';

class CarrinhoReducers extends RxReducer {
  final CarrinhoState estado;
  final IPedidoApiService api;

  CarrinhoReducers(this.estado, this.api) {
    on(() => [estado.adicionar], _adicionar);
    on(() => [estado.limpar], _limpar);
    on(() => [estado.finalizar], _finalizar);
  }

  _adicionar() {

    final lanche = estado.adicionar.value;
    if (lanche != null) {
      estado.carrinho.add(lanche);
    }
  }

  _finalizar() async {
    estado.processando.setValue(true);
    if(estado.carrinho.isNotEmpty) {
      final pedido = Pedido(id: "", lanches: estado.carrinho, dataHora: DateTime.now());
      await api.salvar(pedido);
      estado.carrinho.clear();
      estado.mensagem.value = "Pedido finalizado!";
    } else {
      estado.mensagem.value = "Carrinho vazio!!";
    }
    estado.processando.value = false;
  }

  _limpar() {
    estado.carrinho.clear();
  }
}