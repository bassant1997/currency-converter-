import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import '../models/currency_model.dart';

class HiveHelper {
  HiveHelper._();

  static final HiveHelper _instance = HiveHelper._();

  static HiveHelper get instance => _instance;

  Future<void> initialize() async {
    await Hive.initFlutter();
    Hive.registerAdapter(CurrencyAdapter());
    await Hive.openBox<Currency>('currenciesBox');
  }

  Future<void> storeDataLocally(List<Currency> currencies) async {
    final currenciesList = Hive.box<Currency>('currenciesBox');
    await currenciesList.clear();
    await currenciesList.addAll(currencies);
  }

  Future<List<Currency>> readFromLocalData() async {
    final currencyBox = Hive.box<Currency>('currenciesBox');
    final currenciesList = currencyBox.values.toList();
    return currenciesList;
  }

  Future<bool> isLocalDataEmpty() async {
    final currenciesBox = Hive.box<Currency>('currenciesBox');
    return currenciesBox.isEmpty;
  }
}
