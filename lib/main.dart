import 'package:flutter/material.dart';

import 'src/app.dart';
import 'src/di/injection_container.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const App());
}
