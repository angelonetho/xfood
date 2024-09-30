import 'package:uno/uno.dart';

import 'package:xfood/models/lanche.dart';

import 'i_lanches_api_service.dart';
import 'utils.dart';

class LanchesApiServiceImpl implements ILanchesApiService {
  final Uno uno;

  LanchesApiServiceImpl(this.uno);

  //faz uma requisição e recebe a lista de lanches
  @override
  Future<List<Lanche>> fetchLanches() async {
    final response = await uno.get(urlApi + "/lanches.json");
    final cardapio = response.data as List;

    final resultado = <Lanche>[];

    for (final e in cardapio) {
      resultado.add(Lanche.fromMap(e));
    }

    return resultado;
  }
}
