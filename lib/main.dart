import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_angka/injection.dart';
import 'package:flutter_angka/presentation/routes/routers.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

void main() {
  configureInjection(Environment.dev);
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Flutter Angka",
      debugShowCheckedModeBanner: false,
      smartManagement: SmartManagement.full,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: Routes().routes,
      initialRoute: Routes.calculation,
    );
  }
}
