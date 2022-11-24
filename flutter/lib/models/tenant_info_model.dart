import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';

class TenantInfo {
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
  Uint8List bytes;
  String ext;

  TenantFiles(this.fileName, this.bytes, this.ext);

  Map toJson() => {
        'fileName': fileName,
        'bytes': bytes,
        'ext': ext,
      };
}

class AmenitiesModel {
  String amenityName;
  double amenityPrice;
  AmenitiesModel(this.amenityName, this.amenityPrice);
  Map toJson() => {'amenityName': amenityName, 'amenityPrice': amenityPrice};
}
