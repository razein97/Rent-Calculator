import 'package:flutter/material.dart';
import 'package:rent_calculator/helpers/database_helpers.dart';
import 'package:rent_calculator/models/tenant_info_model.dart';
import 'package:rent_calculator/providers/building_provider.dart';

class TenantProvider extends ChangeNotifier {
  List<TenantInfo> tenantsDetails = [];
  bool saving = false;

  void addTenant(TenantInfo tenantInfo) {
    tenantsDetails.add(tenantInfo);
    notifyListeners();
  }

  void updateTenant(TenantInfo oldInfo, TenantInfo updatedInfo) {
    tenantsDetails.contains(oldInfo)
        ? tenantsDetails[tenantsDetails
            .indexWhere((element) => element == oldInfo)] = updatedInfo
        : oldInfo;
    notifyListeners();
  }

  void removeTenant(TenantInfo info) {
    tenantsDetails.remove(info);
    notifyListeners();
  }

  Future<void> saveTenantDetailsToDB(int buildingID, int unitID, double rent,
      double securityDeposit, String amenities, int checkInDate) async {
    await DatabaseTenantsHelper.saveTenantDetails(buildingID, unitID, rent,
        securityDeposit, tenantsDetails, amenities, checkInDate);
    //Update status of unit to rented
    await DatabaseUnitHelpers.updateUnitRentedStatus(buildingID, unitID, true);

    saving = false;
  }

  void notifyListener() {
    notifyListeners();
  }
}
