import 'package:hive/hive.dart';

part 'currency_model.g.dart';

@HiveType(typeId: 0)
class Currency extends HiveObject {
  @HiveField(0)
  String? currencyCode;
  @HiveField(1)
  String? currencyName;
  @HiveField(2)
  String? countryName;
  @HiveField(3)
  String? icon;

  Currency({this.currencyCode, this.currencyName, this.countryName, this.icon});

  Currency.fromJson(Map<String, dynamic> json) {
    currencyCode = json['currencyCode'];
    currencyName = json['currencyName'];
    countryName = json['countryName'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['currencyCode'] = currencyCode;
    data['currencyName'] = currencyName;
    data['countryName'] = countryName;
    data['icon'] = icon;
    return data;
  }
}
