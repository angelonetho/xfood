import 'package:rx_notifier/rx_notifier.dart';
import 'package:xfood/atoms/home_page_state.dart';
import 'package:xfood/repositories/i_lanche_repository.dart';

import '../models/lanche.dart';

//classe responsável por implementar as regras de negócio
//e executá-las quando alguma ação ser invocada.
//Deve extender da classe RxReducer, para permitir escutar
//as ações.
class HomePageReducers extends RxReducer {
  final HomePageState state;
  final ILancheRepository repository;

  HomePageReducers(this.state, this.repository) {
    on(() => [state.fetchList], _fetchList);
  }

  _fetchList() async {
    final lista = await repository.listar();
    state.lanchesList.clear();
    state.lanchesList.addAll(lista);
  }
}
