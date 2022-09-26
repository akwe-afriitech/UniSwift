import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:momo_universe/screen/paylink.dart';
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


   final _companyController = TextEditingController();

  final _amtController = TextEditingController();

  final _sloganController = TextEditingController();

   final _theme = ["pick a theme color","Blue","purple","Red","black","green"];

   void initState(){
     super.initState();
     _amtController.addListener((){
       setState(() {
         _amt=_amtController.text;
       });
     });
     _companyController.addListener((){
       setState(() {
         _companyname=_companyController.text;
       });
     });
     _sloganController.addListener((){
       setState(() {
         _slogan=_sloganController.text;
       });
     });
   }

  @override
  Widget build(BuildContext context) {
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
                      title:Row(
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
                    ListTile(
                      title:Container(
                        margin: EdgeInsets.symmetric(vertical: 10.0),
                        child: TextFormField(
                          controller: _companyController,
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
                          controller: _sloganController,
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
                          controller: _amtController,
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
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) {
                            //       return Paylink(
                            //         amt: _amtController.text,
                            //         companyName: _companyController.text,
                            //         slogan: _sloganController.text,
                            //
                            //       );
                            //     },),);
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
