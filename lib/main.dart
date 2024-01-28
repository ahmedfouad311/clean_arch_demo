import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import 'di/injector.dart';
import 'my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies(
      environment: const String.fromEnvironment("app_env",
      defaultValue: Environment.prod));
  runApp(const MyApp());
}