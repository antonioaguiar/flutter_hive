import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:testehive/controllers/app_controller.dart';
import 'package:testehive/pages/home_page.dart';
import 'package:testehive/providers/escolas_provider.dart';

import 'models/escolas_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter(EscolasModelAdapter());
  //await deleteBox('escolasBox');
  await Hive.openBox<EscolasModel>('escolas');

  runApp(const MyApp());

  // WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((_) {
  //   Hive.close();
  // });
}

Future<void> deleteBox(String boxName) async {
  var box = Hive.box<EscolasModel>(boxName);

  await box.close();
  await box.deleteFromDisk();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AppController>(create: (_) => AppController()),
        ChangeNotifierProvider<EscolasProviders>(
            create: (_) => EscolasProviders())
      ],
      child: MaterialApp(
        title: 'Demo Hive',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomePage(),
      ),
    );
  }
}
