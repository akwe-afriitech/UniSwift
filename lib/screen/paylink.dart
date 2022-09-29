import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Paylink extends StatelessWidget {
   Paylink({Key? key}) : super(key: key);
   final Stream<QuerySnapshot> paylinks =
   FirebaseFirestore.instance.collection("paylinks").snapshots();
   final Stream<QuerySnapshot> momo_universe =
   FirebaseFirestore.instance.collection("momo_universe").snapshots();

 final _useramt = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Container(
                child: Row(
                  children: [
                    Expanded(
                      flex:5,
                      child: Container(
                        width: 180,
                        height: 120.0,
                        margin: EdgeInsets.all(15),
                        padding: EdgeInsets.all(7.5),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.blueGrey,
                            width: 5.0,
                          ),
                          shape: BoxShape.circle,
                        ),
                        alignment: Alignment.center,
                        child:Text("Logo") ,
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Column(
                        children: [
                          Container(
                            alignment:Alignment.centerLeft,
                            child:StreamBuilder<QuerySnapshot>(
                              stream: paylinks,
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
                                return Text("${data1.docs[0]['companyName']}",
                                  style: TextStyle(
                                    fontSize:30, fontWeight: FontWeight.bold,
                                  ),
                                );
                              },
                            ),
                          ),
                          Container(
                            alignment:Alignment.centerLeft,
                            child: StreamBuilder<QuerySnapshot>(
                              stream: paylinks,
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
                                return Text("${data1.docs[0]['slogan']}",
                                  style: TextStyle(
                                    fontSize:15,
                                  ),
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin:EdgeInsets.all(20),
                child: Text("You are about to tansfer the sum of :"),
              ),
              Container(
                margin:EdgeInsets.all(0),
                child: StreamBuilder<QuerySnapshot>(
                  stream: paylinks,
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

                    if(data1.docs[0]['amt']==null){
                      return TextFormField(

                          controller: _useramt,
                          validator: (value) {
                            if(value== null || value.isEmpty){
                              return 'please enter an amt';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            hintText: "enter amount to send",
                            icon: Icon(Icons.verified_user_outlined),
                          ),

                      );
                    }
                    return Text("${data1.docs[0]['amt']}",
                      style: TextStyle(
                        fontSize:30, fontWeight: FontWeight.bold,
                      ),
                    );
                  },
                )  ,
              ),
              Container(
                margin: EdgeInsets.all(25),
                child:StreamBuilder<QuerySnapshot>(
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
                    return Text("to ${data1.docs[0]['name']} using Mtn mobile Money"
                        "Click send to proceed with payment");
                  },),

              ),
              Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Colors.yellow,
                    border: Border.all(width: 1,color: Colors.black12),
                ),
                child:Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("MTN ",style: TextStyle(
                          fontSize: 28,fontWeight: FontWeight.bold
                        ), ),
                        Text(" EveryWhere You Go",style: TextStyle(
                          fontSize: 25,fontWeight: FontWeight.bold,
                          color: Colors.blue
                        ),)
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                        child: Text("MTN MoMo",style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                        ),),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),

                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(300, 50),
                    shape: StadiumBorder(),
                  ),
                  child: Text('Pay',style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 20
                  ),),
                  onPressed: (){},
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
