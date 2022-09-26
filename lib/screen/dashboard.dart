import 'package:flutter/material.dart';
class Board extends StatelessWidget {
  const Board({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'.toUpperCase()),
        backgroundColor: Colors.green,
      ),
      body: const Center(
        child: Text.rich(
            TextSpan(
                text: 'hello ',
                children: [
                  TextSpan(
                      text: 'UNISWIF',




                      style: TextStyle(fontSize: 50.0,fontWeight: FontWeight.bold,color: Colors.green)
                  )
                ]
            )
        ),
      ),
    );
  }
}
