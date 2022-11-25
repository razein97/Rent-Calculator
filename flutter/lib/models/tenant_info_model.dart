import 'dart:convert';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';

class TenantInfo {
  int? tenantID;
  int? buildingID;
  int? unitID;
  String? firstName;
  String? lastName;
  String? streetAddressLine1;
  String? streetAddressLine2;
  String? city;
  String? state;
  String? pincode;
  String? country;
  String? phoneHome;
  String? phoneWork;
  String? phoneEmergency;
  String? email;
  String? notes;
  List<PlatformFile>? profilePhotos;
  List<PlatformFile>? tenantDocs;
}

class TenantFiles {
  String fileName;
  int size;
  Uint8List bytes;

  TenantFiles(
    this.fileName,
    this.size,
    this.bytes,
  );

  Map toJson() => {
        'fileName': fileName,
        'size': size,
        'bytes': base64.encode(bytes),
      };
}

class AmenitiesModel {
  String amenityName;
  double amenityPrice;
  AmenitiesModel(this.amenityName, this.amenityPrice);
  Map toJson() => {'amenityName': amenityName, 'amenityPrice': amenityPrice};
}
