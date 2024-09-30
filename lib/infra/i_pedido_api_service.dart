import 'package:xfood/models/pedido.dart';

abstract class IPedidoApiService {
  Future<Pedido> salvar(Pedido pedido);
  Future<List<Pedido>> listar();
}
