import 'dart:convert';
import 'package:file_picker/file_picker.dart';
import 'package:rent_calculator/models/tenant_info_model.dart';

class JsonEncoder {
  static String jsonEncodeFile(List<PlatformFile> files) {
    List<TenantFiles> tenantFilesMap = [];
    String tenantFilesJson = '';
    if (files.isNotEmpty) {
      for (var file in files) {
        tenantFilesMap
            .add(TenantFiles(file.name, file.bytes!, file.extension!));
      }
    }
    if (tenantFilesMap.isNotEmpty) {
      tenantFilesJson = jsonEncode(tenantFilesMap);
    }
    return tenantFilesJson;
  }
}
