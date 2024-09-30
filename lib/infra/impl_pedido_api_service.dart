import 'package:uno/uno.dart';
import 'package:xfood/infra/i_pedido_api_service.dart';
import 'package:xfood/models/pedido.dart';

import 'utils.dart';

class PedidoApiServiceImpl implements IPedidoApiService {
  final Uno uno;

  PedidoApiServiceImpl(this.uno);

  @override
  Future<List<Pedido>> listar() async {
    final response = await uno.get(urlApi + "/pedidos.json");
    final pedidos = response.data as Map;

    final resultado = <Pedido>[];

    for (final k in pedidos.keys) {
      final p = pedidos[k];
      p['id'] = k;
      resultado.add(Pedido.fromMap(p));
    }
    return resultado;
  }

  @override
  Future<Pedido> salvar(Pedido pedido) async {
    final resp =
        await uno.post(urlApi + "/pedidos.json", data: pedido.toJson());

    if (resp.status == 200) {
      return pedido.copyWith(id: resp.data["name"]);
    }
    return Pedido(id: "", lanches: [], dataHora: DateTime.now());
  }
}
