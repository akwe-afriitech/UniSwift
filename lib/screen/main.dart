// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_flutter/models/user.dart';
// import 'package:firebase_flutter/screens/wrapper.dart';
// import 'package:firebase_flutter/services/auth.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:provider/provider.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return StreamProvider<Users?>.value(
//       value: AuthService().user,
//       initialData: Users(uid: 'user'),
//       child: MaterialApp(
//         home: Wrapper(),
//       ),
//     );
//   }
// }