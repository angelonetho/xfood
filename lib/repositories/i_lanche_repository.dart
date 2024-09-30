import '../models/lanche.dart';

abstract class ILancheRepository {
  Future<List<Lanche>> listar();
}
