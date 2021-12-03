import 'package:flutter/material.dart';
import 'package:vapeteka/presentation/pages/application.dart';
import 'package:vapeteka/services/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PreferencesService.init();
  runApp(const MyApp());
}
