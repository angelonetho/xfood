import 'package:rx_notifier/rx_notifier.dart';

import '../models/lanche.dart';

//classe responsável por definir o estado da página home.
class HomePageState {
  final lanchesList = RxList<Lanche>([]);

  final fetchList = RxNotifier.action();



}
