import 'package:flutter/cupertino.dart';
import 'package:rent_calculator/models/tenant_info_model.dart';

class TenantProvider extends ChangeNotifier {
  List<TenantInfo> tenantsDetails = [];

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
}
