import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:momo_universe/repo/auth.dart';
import 'package:momo_universe/repo/shared_pref_service.dart';
import 'package:momo_universe/screen/Dashboard2.dart';
import 'home_page.dart';
import 'login_register_page.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({Key? key}) : super(key: key);

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.hasData ){
          return Dashboard2();
        }else{
          return LoginPage();
        }
      }
    );
  }
}
