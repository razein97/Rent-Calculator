import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as services;
import 'app.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await services.SystemChrome.setPreferredOrientations([
    services.DeviceOrientation.portraitUp,
    services.DeviceOrientation.portraitDown
  ]);
  LicenseRegistry.addLicense(() async* {
    final license =
        await services.rootBundle.loadString('assets/google_fonts/LICENSE.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });
  // HttpOverrides.global = MyHttpOverrides();
  runApp(
    const App(),
  );
}
