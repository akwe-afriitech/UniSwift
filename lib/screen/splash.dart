import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:momo_universe/screen/login.dart';


class Splash extends StatefulWidget {
   const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                Login()
            )
        )
    );
  }
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 350.0,
          height: 250.0,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            // borderRadius: BorderRadius.circular(50),
            border: Border.all(color:Colors.green,width: 6.0),
            shape: BoxShape.circle
          ),
          child: Text("uniswift",
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Colors.green,
          ),
          ),
        ),
      ),
    );
  }
}
