import 'package:flutter/material.dart';
import 'package:momo_universe/repo/auth.dart';
import 'package:momo_universe/screen/costumiselink.dart';
import 'package:momo_universe/screen/customize.dart';
import 'package:momo_universe/screen/faqs.dart';
import 'package:momo_universe/screen/invoice.dart';
import 'package:momo_universe/screen/recieve.dart';
import 'package:momo_universe/screen/send.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Dashboard2 extends StatelessWidget {
  Dashboard2({Key? key}) : super(key: key);

  final User? user = Auth().currentUser;
  final _amtController=TextEditingController();
  final _numController=TextEditingController();
  Future<void> signOut() async {
    await Auth().signOut();
  }

  final Stream<QuerySnapshot> momo_universe =
      FirebaseFirestore.instance.collection("momo_universe").snapshots();
  Widget _names(){
    return StreamBuilder<QuerySnapshot>(
    stream: momo_universe,
    builder: (
        BuildContext context,
        AsyncSnapshot<QuerySnapshot> snapshot,
        ) {
      if (snapshot.hasError) {
        return Text("error loading data");
      }
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Text("loading.....");
      }
      final data1 = snapshot.requireData;
      return Text("${data1.docs[0]['number']}");
    },);
  }
  Widget _title() {
    return const Text("UniSwif");
  }

  Widget _userUi() {
    return Text(
      user?.email ?? "user email",
    );
  }

  Widget _usernum() {
    return Text(user?.phoneNumber ?? "usernum");
  }

  Widget _signOutButton() {
    return ElevatedButton(onPressed: signOut, child: Text("signout"));
  }

  Widget _userName() {
    return Text("user");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Container(child: Text("UniSwif".toUpperCase())),
          backgroundColor: Colors.green,
        ),
        drawer: Drawer(

          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  child: Icon(Icons.person),
                ),
                accountName: Container(
                  child: StreamBuilder<QuerySnapshot>(
                    stream: momo_universe,
                    builder: (
                      BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot,
                    ) {
                      if (snapshot.hasError) {
                        return Text("error loading data");
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Text("loading.....");
                      }
                      final data1 = snapshot.requireData;
                      return Text("${data1.docs[0]['name']}",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      );
                    },
                  ),
                ),
                accountEmail: Container(
                  child: StreamBuilder<QuerySnapshot>(
                    stream: momo_universe,
                    builder: (
                      BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot,
                    ) {
                      if (snapshot.hasError) {
                        return Text("error loading data");
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Text("loading.....");
                      }
                      final data1 = snapshot.requireData;
                      return Text("${data1.docs[0]['number']}");
                    },
                  ),
                ),
                otherAccountsPictures: [
                  CircleAvatar(
                    child: Icon(Icons.person_add),
                  ),
                ],
              ),
              ListTile(
                tileColor: Colors.grey[200],
                leading: Icon(Icons.home),
                title: Text("Home"),
              ),
              ListTile(
                leading: Icon(Icons.money),
                title: Text("generate paylinks"),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Coustomize() ));
                },
              ),
              ListTile(
                leading: Icon(Icons.history_sharp),
                title: Text("Invoice"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => Invoice()),
                    ),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.question_answer),
                title: Text("FAQS"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FAQS(),
                    ),
                  );
                },
              ),
              Container(
                width: 20,
                margin: EdgeInsets.symmetric(horizontal:50),
                padding: EdgeInsets.symmetric(vertical:50),

                child: _signOutButton(),

              ),
            ],
          ),
        ),
        body: Container(
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(25),
                        bottomLeft: Radius.circular(25))),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.all(5.0),
                      child: Text(
                        "Welcome Back",
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  width: 375.0,
                  height: 200.0,
                  padding: const EdgeInsets.all(20.0),
                  margin: const EdgeInsets.all(5.0),
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.green, width: 1.0),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade300,
                            blurRadius: 7,
                            spreadRadius: 1,
                            offset: Offset(2, 2))
                      ],
                      borderRadius: BorderRadius.circular(40.0)),
                  child: Column(
                    children: [
                      Container(
                        height: 70,
                        child: Row(
                          children: [
                            Container(
                                padding: EdgeInsets.symmetric(horizontal: 20.0),
                                child: CircleAvatar(
                                    child: Icon(
                                  Icons.person,
                                ))),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: StreamBuilder<QuerySnapshot>(
                                    stream: momo_universe,
                                    builder: (
                                      BuildContext context,
                                      AsyncSnapshot<QuerySnapshot> snapshot,
                                    ) {
                                      if (snapshot.hasError) {
                                        return Text("error loading data");
                                      }
                                      if (snapshot.connectionState ==
                                          ConnectionState.waiting) {
                                        return Text("loading.....");
                                      }
                                      final data1 = snapshot.requireData;
                                      return Text(
                                          "${data1.docs[0]['name']}",
                                        style: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold),
                                      );
                                    },
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Cameroon",
                                    style: TextStyle(
                                      color: Colors.green[800],
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Expanded(
                              child: Container(
                                alignment: Alignment.centerRight,
                                child: Icon(
                                  Icons.add_alert,
                                  color: Colors.green[500],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 38,
                            child: Container(
                              child: Text(
                                "Your contact:",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 62,
                            child: Container(
                              alignment: Alignment.centerLeft,
                              child: StreamBuilder<QuerySnapshot>(
                                stream: momo_universe,
                                builder: (
                                  BuildContext context,
                                  AsyncSnapshot<QuerySnapshot> snapshot,
                                ) {
                                  if (snapshot.hasError) {
                                    return Text("error loading data");
                                  }
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return Text("loading.....");
                                  }
                                  final data1 = snapshot.requireData;
                                  return Text(
                                      "${data1.docs[0]['number']}",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),);
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              child: Text(
                                "Your Network:",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Mtn",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black38),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  )),
              Container(
                  margin: EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              fixedSize: Size(125, 40),
                              elevation: 8,
                              shape: StadiumBorder(),
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.green,
                              side: BorderSide(color: Colors.green, width: 1)),
                          child: Text(
                            "send",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                            ),
                          ),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                contentPadding: EdgeInsets.all(10),
                                content: Container(
                                  height: 250,
                                  padding: EdgeInsets.all(5),
                                  child: Column(
                                    children: [
                                      Container(
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Container(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  "local transfer",
                                                  style:
                                                      TextStyle(fontSize: 15),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                color: Colors.white,
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 2),
                                                child: OutlinedButton(
                                                  style:
                                                      OutlinedButton.styleFrom(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(0.5)),
                                                  onPressed: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) {
                                                          return Send();
                                                        },
                                                      ),
                                                    );
                                                  },
                                                  child: const Text(
                                                    "global transfer",
                                                    style:
                                                        TextStyle(fontSize: 14),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      TextFormField(
                                        controller: _numController,
                                        decoration: const InputDecoration(
                                          hintText: "Enter MoMo Number",
                                          hintStyle: TextStyle(fontSize: 13),
                                          icon: Icon(
                                              Icons.verified_user_outlined),
                                        ),
                                      ),
                                      TextFormField(
                                        controller: _amtController,
                                        decoration: const InputDecoration(
                                          hintText: "Enter Amount",
                                          hintStyle: TextStyle(fontSize: 13),
                                          icon: Icon(
                                              Icons.verified_user_outlined),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 10.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Container(
                                                child: ElevatedButton(
                                                  child: Text("Cancel"),
                                                  onPressed: () => Navigator.pop(context),
                                                ),
                                              ),
                                              Container(
                                                child: ElevatedButton(
                                                  onPressed: () {
                                                    final number = _numController.text;
                                                    final amt = _amtController.text;
                                                    if(number.isEmpty || amt.isEmpty){
                                                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text('please fill the fields')));
                                                    }else{

                                                    }
                                                  },
                                                  child: Text("Send"),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Container(
                        child: OutlinedButton(
                          style: ElevatedButton.styleFrom(
                              fixedSize: Size(125, 40),
                              elevation: 8,
                              shape: StadiumBorder(),
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.green,
                              side: BorderSide(color: Colors.green, width: 1)),
                          child: const Text(
                            "Recieve",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return Recieve();
                            }));
                          },
                        ),
                      )
                    ],
                  )),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.all(15.0),
                child: const Text(
                  "Recent Transactions:",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  width: 325,
                  margin: EdgeInsets.all(10),
                  height: 150,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40.0)),
                  child: Center(
                      child: Text("You havent done any transaction yet")),
                  // child: ListView(
                  //   children:const [
                  //
                  //     ListTile(
                  //       leading: Icon(Icons.arrow_upward),
                  //       title: Text("2000 " " FCFA"),
                  //       subtitle: Text("650204677"),
                  //
                  //       trailing: Icon(Icons.delete),
                  //     ),
                  //
                  //   ]
                  // ),
                ),
              ),
            ],
          ),
        ));
  }
}
