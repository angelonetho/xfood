import 'package:rx_notifier/rx_notifier.dart';
import 'package:xfood/models/lanche.dart';

class CarrinhoState{
  final carrinho = RxList<Lanche>([]);
  final processando = RxNotifier<bool>(false);
  final mensagem = RxNotifier<String>("");

  double get total {
    double soma = carrinho.fold(0.0, (acumulador, lanche) {
      return acumulador + lanche.valor;
    });

    return soma;
  }

  final adicionar = RxNotifier<Lanche?>(null);
  final limpar = RxNotifier.action();
  final finalizar = RxNotifier.action();
}