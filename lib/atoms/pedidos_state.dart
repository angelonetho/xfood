import 'package:rx_notifier/rx_notifier.dart';
import 'package:xfood/models/pedido.dart';

class PedidosState{
  final pedidosList = RxList<Pedido>([]);

  final fetchList = RxNotifier.action();

}