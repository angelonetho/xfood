import 'package:flutter_test/flutter_test.dart';
import 'package:uno/uno.dart';
import 'package:xfood/infra/impl_lanches_api_service.dart';

void main() {
  test("Consegue buscar lista de lanches", () async {
    final service = LanchesApiServiceImpl(Uno());

    final lista = await service.fetchLanches();

    expect(lista.length, 8);
  });
}
