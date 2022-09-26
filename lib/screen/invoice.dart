import 'package:flutter/material.dart';

class Invoice extends StatelessWidget {
  const Invoice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Invoices"),
        centerTitle: true,
      ),
      body: Container(
        height: 400,
        child: Column(
          children: [
              Container(
                margin: EdgeInsets.all(25.0),
                child: Text("You havent done any transaction yet"),
              ),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
