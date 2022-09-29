import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:momo_universe/screen/paylink.dart';
import 'package:firebase_core/firebase_core.dart';

class Coustomize extends StatefulWidget {
  const Coustomize({Key? key}) : super(key: key);

  @override
  State<Coustomize> createState() => _CoustomizeState();
}

class _CoustomizeState extends State<Coustomize> {
  final _formkey = GlobalKey<FormState>();
  var _companyname;
  var _slogan;
  var _amt;
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    CollectionReference paylinks =
        FirebaseFirestore.instance.collection('paylinks');
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.all(20),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      "Click to add your company logo",
                      style:
                          TextStyle(decorationStyle: TextDecorationStyle.wavy),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 78,
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.all(15),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.person,
                      size: 60,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              child: Form(
                  key: _formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: "Write in your company name",
                          icon: Icon(Icons.verified_user_outlined),
                        ),
                        onChanged: (value) {
                          _companyname = value;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your company name';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: "write your company slogan",
                          icon: Icon(Icons.verified_user_outlined),
                        ),
                        onChanged: (value) {
                          _slogan = value;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your company name';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: "Enter Amt",
                          icon: Icon(Icons.verified_user_outlined),
                        ),
                        onChanged: (value) {
                          _amt = value;
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size(300, 40),
                            shape: StadiumBorder(),
                          ),
                          child: Text("click to generate pay link"),
                          onPressed: () {
                            if (_formkey.currentState!.validate()) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text("generating paylink"),
                              ));
                              setState(() {
                                isVisible = !isVisible;
                              });
                              paylinks
                                  .add({
                                    'companyName': _companyname,
                                    'slogan': _slogan,
                                    'amt': _amt
                                  })
                                  .then((value) => print('link added'))
                                  .catchError(
                                      (error) => print('fail to upload data'));
                            }

                          },
                        ),
                      ),
                      Container(
                          child: Visibility(
                        visible: isVisible,
                        child: Column(
                          children: [
                            Container(

                              margin:EdgeInsets.all(10),
                              padding:EdgeInsets.all(10),

                              decoration: ShapeDecoration(
                                color: Colors.grey,

                                shape: StadiumBorder(),
                              ),
                              child: Text("LocalHost/6.4.3.2/#/paylink"),
                            ),
                            Container(
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          shape: StadiumBorder()
                                      ),
                                      child: Text("Copy"),
                                      onPressed: () async{
                                        await Clipboard.setData(ClipboardData(text: "LocalHost/6.4.3.2/#/paylink"));
                                      },
                                    ),
                                  ),
                                  Container(
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        shape: StadiumBorder()
                                      ),
                                      onPressed: () async {
                                        await Clipboard.setData(ClipboardData(text: "your text"));
                                      },
                                      child: Text("Share"),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        )
                        ),
                      )
                    ],
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
