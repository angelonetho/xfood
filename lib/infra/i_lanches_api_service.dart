import 'package:xfood/models/lanche.dart';

abstract class ILanchesApiService {
  Future<List<Lanche>> fetchLanches();
}
