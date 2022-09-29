import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:momo_universe/repo/widget_tree.dart';
import 'package:momo_universe/screen/splash.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'repo/shared_pref_service.dart';

Future<void>main ()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();


  runApp(const MyApp());
}

// void main() => runApp(const MyApp());


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'uniswif',
      theme: ThemeData(
          primarySwatch: Colors.green
      ),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: WidgetTree(),

    );
  }
}



