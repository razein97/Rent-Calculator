import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as services;
import 'package:window_size/window_size.dart';
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

  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    setWindowTitle('Rent Calculator');
    setWindowMinSize(const Size(400, 300));
    setWindowMaxSize(Size.infinite);
  }
  runApp(
    const App(),
  );
}
