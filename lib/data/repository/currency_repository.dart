import 'package:currency_converter/data/database/hive_helper.dart';
import 'package:currency_converter/data/models/historical_data_model.dart';
import 'package:dio/dio.dart';

import '../models/api_model.dart';
import '../models/currency_model.dart';

class CurrenciesRepository {
  final _dio = Dio();
  final _hiveHelper = HiveHelper.instance;
  final apiKey = 'pr_c885b2ad9fd14be7aff2c690ef001c72';

  Future<ApiResponse<List<Currency>?>> listSupportedCurrencies() async {
    if (await _hiveHelper.isLocalDataEmpty()) {
      try {
        final response = await _dio
            .get('https://api.currencyfreaks.com/v2.0/supported-currencies');
        _hiveHelper.storeDataLocally(
            (response.data['supportedCurrenciesMap'] as Map)
                .values
                .map((e) => Currency.fromJson(e))
                .toList());
        return ApiResponse.success(
            data: (response.data['supportedCurrenciesMap'] as Map)
                .values
                .map((e) => Currency.fromJson(e))
                .toList());
      } on DioError catch (error) {
        return ApiResponse.error(error: error.message);
      }
    } else {
      return ApiResponse.success(data: await _hiveHelper.readFromLocalData());
    }
  }

  Future<ApiResponse<HistoricalData>> listHistoricalCurrency(
      String startDate,
      String endDate,
      String currencyCodeFirst,
      String currencyCodeSecond) async {
    try {
      final response = await _dio.get(
          'https://free.currconv.com/api/v7/convert?q=$currencyCodeFirst,$currencyCodeSecond&compact=ultra&date=$startDate&endDate=$endDate&apiKey=$apiKey');

      return ApiResponse.success(data: HistoricalData.fromJson(response.data));
    } on DioError catch (error) {
      return ApiResponse.error(error: error.message);
    }
  }

  Future<ApiResponse<List>> fetchConverterResult(String from, String to) async {
    try {
      final response = await _dio.get(
          'https://free.currconv.com/api/v7/convert?q=$from,$to&compact=ultra&apiKey=$apiKey');
      return ApiResponse.success(data: (response.data as Map).values.toList());
    } on DioError catch (error) {
      return ApiResponse.error(error: error.message);
    }
  }
}
