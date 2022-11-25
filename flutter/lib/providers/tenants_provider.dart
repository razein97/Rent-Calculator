import 'package:flutter/material.dart';
import 'package:rent_calculator/helpers/database_helpers.dart';
import 'package:rent_calculator/helpers/json_file_encoders.dart';
import 'package:rent_calculator/models/tenant_info_model.dart';
import 'package:rent_calculator/providers/building_provider.dart';
import 'package:sqlite3/common.dart';

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
    notifyListeners();
  }

  Future<void> getTenantDetailsFromDB(int buildingID, int unitID) async {
    tenantsDetails.clear();
    ResultSet resultSet =
        await DatabaseTenantsHelper.getTenantDetails(buildingID, unitID);
    if (resultSet.isNotEmpty) {
      for (var result in resultSet) {
        TenantInfo info = TenantInfo();
        info.tenantID = result['id'];
        info.buildingID = result['building_id'];
        info.unitID = result['unit_id'];
        info.firstName = result['first_name'];
        info.lastName = result['last_name'];
        info.streetAddressLine1 = result['street_address_1'];
        info.streetAddressLine2 = result['street_address_2'];
        info.city = result['city'];
        info.state = result['state'];
        info.state = result['state'];
        info.pincode = result['postal_code'];
        info.country = result['country'];
        info.phoneHome = result['phone_home'];
        info.phoneWork = result['phone_work'];
        info.phoneEmergency = result['phone_emergency'];
        info.email = result['email'];
        info.notes = result['notes'];
        info.profilePhotos =
            JsonEncoderDecoder.jsonDecodeFile(result['profile_photos']);
        info.tenantDocs =
            JsonEncoderDecoder.jsonDecodeFile(result['documents']);
        tenantsDetails.add(info);
      }
    }
    notifyListeners();
  }

  Future<void> updateTenantDetailsInDB(
      int tenantID, int buildingID, int unitID, TenantInfo info) async {
    await DatabaseTenantsHelper.updateTenantDetails(
        tenantID, buildingID, unitID, info);
  }

  void notifyListener() {
    notifyListeners();
  }
}
