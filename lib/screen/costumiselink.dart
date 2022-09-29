import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:momo_universe/screen/paylink.dart';
import 'package:firebase_core/firebase_core.dart';
class Costumisepl extends StatefulWidget {
   Costumisepl({Key? key}) : super(key: key);

  @override
  State<Costumisepl> createState() => _CostumiseplState();
}

class _CostumiseplState extends State<Costumisepl> {
   var _companyname;

   var _slogan;

   var _amt;
   bool isVisible=false;
   final _theme = ["pick a theme color","Blue","purple","Red","black","green"];
   final _formkey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
     CollectionReference paylinks = FirebaseFirestore.instance.collection('paylinks');
    return Scaffold(
      appBar: AppBar(
      ),
      body: Container(
        child: Column(
          children:  [
            Expanded(
              child: Container(
                child: ListView(
                  children: [
                    ListTile(
                      title:Form(
                        key: _formkey,
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                child: Text("Click to add your company logo",style: TextStyle(
                                    decorationStyle: TextDecorationStyle.wavy
                                ),),
                              ),
                            ),
                            Expanded(
                              child: Container(

                                height: 100,
                                padding: EdgeInsets.all(5),
                                margin: EdgeInsets.all(15),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(Icons.person, size: 60,),
                              ),
                            ),
                          ],
                        ),
                      ),

                    ),
                    ListTile(
                      title:Container(
                        margin: EdgeInsets.symmetric(vertical: 10.0),
                        child: TextFormField(


                            validator: (value) {
                            if(value== null || value.isEmpty){
                              return 'please enter Your Company name';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            hintText: "Write in your company name",
                            icon: Icon(Icons.verified_user_outlined),
                          ),
                        ),
                      ),
                    ),
                    ListTile(
                      title:Container(
                        margin: EdgeInsets.symmetric(vertical: 10.0),
                        child: TextFormField(

                          decoration: const InputDecoration(
                            hintText: "Enter your Company describtion",
                            icon: Icon(Icons.verified_user_outlined),
                          ),
                        ),
                      ),
                    ),
                    ListTile(
                      title:Container(
                        margin: EdgeInsets.symmetric(vertical: 10.0),
                        child: TextFormField(

                          decoration: const InputDecoration(
                            hintText: "enter amount to be recieved number",
                            icon: Icon(Icons.verified_user_outlined),
                          ),
                        ),
                      ),
                    ),
                    ListTile(
                      title:Container(
                        width: 280,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: DropdownButtonFormField(
                              value: _theme[0],
                              items: _theme.map((e) => DropdownMenuItem(child: Text(e), value: e,)
                              ).toList(), onChanged: (val){
                            // setState((){
                            //   _selectValue =val as String;
                            // });
                          }),
                        ),
                      ),
                    ),
                    ListTile(
                      title:Container(
                        margin: EdgeInsets.symmetric(vertical: 10.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size(300, 40),
                            shape: StadiumBorder(),
                          ),
                          child: Text("click to generate pay link"),
                          onPressed: (){
                            setState(() {
                              isVisible = ! isVisible;
                            });
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return Paylink();
                                },),);
                          },
                        ),
                      ),
                    ),
                    ListTile(
                      title:Visibility(
                        visible: isVisible ,
                        child: Container(
                          child: Text("Sorry app not online"),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
