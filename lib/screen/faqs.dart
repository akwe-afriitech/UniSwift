import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class FAQS extends StatefulWidget {
   FAQS({Key? key}) : super(key: key);



  @override
  State<FAQS> createState() => _FAQSState();
}

   bool isVisible = false;
   bool see = false;

class _FAQSState extends State<FAQS> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FAQS"),
      ),
      body: Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(25),
            alignment: Alignment.center,
            child: Text(
              "If you have had any problems with our app so far,"
                  " please check the following questions for assistance."
                  " And if you dont find the answer you are looking for , just send us a message"
            ,style: TextStyle(
              fontSize: 16,
            ),),
          ),
          Expanded(
            child: Container(
              child: ListView(
                children: [
                  ListTile(
                    leading:Icon(Icons.question_answer),
                    title: Text("How to send money "),
                    subtitle: Container(
                      child: Visibility(
                        visible: isVisible ,
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: Text("To send money, click on the send button "
                              "enter the number you want to send and enter the amount then"
                              "click send and finally enter your momo pin to confirm the transaction "
                            ,style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400
                            ),
                          ),
                        ),
                      ),
                    ),
                    trailing: Icon(Icons.add),
                    onTap: (){
                      setState(() {
                         isVisible=!isVisible;
                      });
                    },
                  ),
                  ListTile(
                    leading:Icon(Icons.question_answer),
                    title: Text("How to generate paylink"),
                    subtitle: Container(
                      child: Visibility(
                        visible: see ,
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: Text("Inorder to generate a paylink, you should go to the home"
                              "nav bar ,click on the menu icon and click on generate paylinks then"
                              " customise the paylinks to your likeness"
                          ,style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400
                            ),
                          ),
                        ),
                      ),
                    ),
                    trailing: Icon(Icons.add),
                    onTap: (){
                      setState(() {
                         see=!see;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(15),

            child: Text("If you have more questions , send us an email at momouniverse@gmail.com"
                " for fast replies"
            ),
          )
        ],
      ),
      ),
    );
  }
}
