import 'package:flutter/material.dart';


class Send extends StatelessWidget {
   Send({Key? key}) : super(key: key);

   // _MyformState(){
   //   _selectValue = _countries[0];
   // }

  final _countries = ["Select Country","Cameroon","Gabon","Congo","Chad","RCA"];
  final _paymentMethods = ["Select Network Method","Airtel","BGFi"," MOOV","BCI","Orange"];
  final _amountController =TextEditingController();
  final _num2Controller =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: Container(
        child: Container(
          padding: EdgeInsets.all(20),
          child: ListView(
            children: [

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonFormField(
                  value: _countries[0],
                    items: _countries.map((e) => DropdownMenuItem(child: Text(e), value: e,)
                ).toList(), onChanged: (val){
                  // setState((){
                  //   _selectValue =val as String;
                  // });
                }),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonFormField(
                  value: _paymentMethods[0],
                    items: _paymentMethods.map((e) => DropdownMenuItem(child: Text(e), value: e,)
                ).toList(), onChanged: (val){
                  // setState((){
                  //   _selectValue =val as String;
                  // });
                }),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _amountController,
                  onChanged: (val){},
                  decoration: InputDecoration(
                    labelText: "Enter Amount",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _num2Controller,
                  onChanged: (val){},
                  decoration: InputDecoration(
                    labelText: "Enter Account Number",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: (){},
                    child:Text("Send",style: TextStyle(
                      fontWeight: FontWeight.bold,fontSize: 19
                    ),),
                  style: ElevatedButton.styleFrom(
                    shape: StadiumBorder()
                  ),
                ),
              )
            ],
          ),
        ),
      ),

    );
  }
}

