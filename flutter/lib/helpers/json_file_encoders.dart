import 'dart:convert';
import 'package:file_picker/file_picker.dart';
import 'package:rent_calculator/models/tenant_info_model.dart';

class JsonEncoderDecoder {
  static String jsonEncodeFile(List<PlatformFile> files) {
    List<TenantFiles> tenantFilesMap = [];
    String tenantFilesJson = '';
    if (files.isNotEmpty) {
      for (var file in files) {
        tenantFilesMap.add(
          TenantFiles(
            file.name,
            file.size,
            file.bytes!,
          ),
        );
      }
    }
    if (tenantFilesMap.isNotEmpty) {
      tenantFilesJson = jsonEncode(tenantFilesMap);
    }
    return tenantFilesJson;
  }

  static List<PlatformFile> jsonDecodeFile(String jsonFile) {
    List<PlatformFile> files = [];
    if (jsonFile.isNotEmpty) {
      List decoded = jsonDecode(jsonFile);

      for (var i in decoded) {
        // print(i['bytes'].runtimeType);
        files.add(
          PlatformFile(
              name: i['fileName'],
              size: i['size'],
              bytes: base64.decode(i['bytes'])),
        );
      }
    }
    return files;
  }
}
