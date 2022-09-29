import 'package:flutter/material.dart';

class Recieve extends StatelessWidget {
  const Recieve({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            child: Column(
              children: [
                Container(
                  height: 150,
                ),
                Container(
                  padding: const EdgeInsets.all(18),
                  child: const Text(
                    "Scan QED Code",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                Container(
                  width: 300.0,
                  height: 250.0,
                  decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(30.0)),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30.0),
                    // boxShadow:
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Container(
                    child: const Text("localhost/6.6.4.3/#/paylink"),
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    foregroundColor: Colors.black54,
                                    shape: const StadiumBorder()),
                                onPressed: () {},
                                child: const Text(
                                  "copy",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold),
                                )),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(25.0),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: const StadiumBorder()),
                              onPressed: () {},
                              child: const Text(
                                "Share",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
