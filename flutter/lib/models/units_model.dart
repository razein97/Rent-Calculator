import 'package:rent_calculator/models/tenant_info_model.dart';

class UnitsModel {
  int? unitId;
  int? buildingId;
  String? unitName;
  double? rent;
  double? securityDeposit;
  double? electricityUnit;
  List<AmenitiesModel>? amenities;
  bool? rentedStatus;
  int? rentedDate;
}
