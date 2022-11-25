import 'package:flutter/material.dart';
import 'package:rent_calculator/screens/add_tenant_screen/views/add_tenant_view_desktop.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AddTenantScreen extends StatelessWidget {
  final int buildingID;
  final int unitID;
  final String unitName;

  const AddTenantScreen({
    super.key,
    required this.buildingID,
    required this.unitID,
    required this.unitName,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      // breakpoints: ScreenBreakpoints(mobile),

      mobile: AddTenantViewDesktop(
        buildingID: buildingID,
        unitID: unitID,
        unitName: unitName,
      ),
      tablet: AddTenantViewDesktop(
        buildingID: buildingID,
        unitID: unitID,
        unitName: unitName,
      ),
      desktop: AddTenantViewDesktop(
        buildingID: buildingID,
        unitID: unitID,
        unitName: unitName,
      ),
    );
  }
}
