import 'package:ta_tpm/pages/load.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ta_tpm/helper/shared_preference.dart';
import 'package:ta_tpm/model/data_model.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initiateLocalDB();
  SharedPreference().getLoginStatus().then((status) {
    runApp(MaterialApp(
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false, home: const LoadScreen()
        ));
  });
  runApp(const LoadScreen());
}

void initiateLocalDB() async {
  await Hive.initFlutter();
  Hive.registerAdapter(DataModelAdapter());
  await Hive.openBox<DataModel>("data");
}