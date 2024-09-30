import 'package:xfood/infra/i_lanches_api_service.dart';
import 'package:xfood/models/lanche.dart';
import 'package:xfood/repositories/i_lanche_repository.dart';

class LancheRepositoryImpl implements ILancheRepository {
  final ILanchesApiService service;

  LancheRepositoryImpl(this.service);

  @override
  Future<List<Lanche>> listar() {
    return service.fetchLanches();
  }
}
