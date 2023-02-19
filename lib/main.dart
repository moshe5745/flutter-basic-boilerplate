import 'package:flutter/material.dart';
import 'package:app_name/router.dart';
import 'package:app_name/services/index.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await registerGetItModules();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'App name',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerConfig: router,
    );
  }
}

Future<void> registerGetItModules() async {
  getIt.registerSingleton<Logger>(Logger());
  // allowReassignment - to enable update accessToken
  getIt.allowReassignment = true;
  getIt.registerSingleton<DioClient>(DioClient()..init());
  getIt.registerSingleton(SharedPref()..init());

  await getIt.allReady();
}
