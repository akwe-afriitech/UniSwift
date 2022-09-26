import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Paylink extends StatelessWidget {
   Paylink(
      {Key? key, required this.amt, required this.companyName ,required this.slogan}
      )
      : super(key: key);

  String amt;
  String companyName;
  String slogan;
 final _useramt = TextEditingController();
  showamt(){
    if(amt.isEmpty){
      return Container(

        child: TextFormField(
        controller: _useramt,
        decoration: const InputDecoration(
          hintText: "Enter amount to send",
          icon: Icon(Icons.verified_user_outlined),
        ),
      ),

    );
    }else{
      return Container(
        width: 300,
        height: 100,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.green[100],
          border: Border.all(width: 1,color: Colors.black12),
          borderRadius: BorderRadius.circular(50)
        ),
        child: Text("${amt}frs FCFA", style: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 30
        ),),
      );
    }
  }
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
                        child:Text("mad") ,
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Column(
                        children: [
                          Container(
                            alignment:Alignment.centerLeft,
                            child: Text(companyName, style: TextStyle(
                              fontSize:30, fontWeight: FontWeight.bold,
                            ),),
                          ),
                          Container(
                            alignment:Alignment.centerLeft,
                            child: Text(slogan),
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
                child: showamt() ,
              ),
              Container(
                margin: EdgeInsets.all(25),
                child: Text("to ${companyName} using MTN Mobile Money"
                "Click send to proceed with payment"),
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
