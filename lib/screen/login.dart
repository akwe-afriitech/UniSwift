import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:momo_universe/screen/Dashboard2.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var _userName;
  var _userNum;
  bool isVisible=false;
  final _userController = TextEditingController();
  final _numController = TextEditingController();
  final _companyController=TextEditingController();
  bool? _checkBox = false;
  final _formKey =GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _userController.addListener(_updateText);
    _numController.addListener(_updateNum);
  }

  void _updateNum() {
    setState(() {
      _userNum = _numController.text;
    });
  }

  void _updateText() {
    setState(() {
      _userName = _userController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("login page"),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          alignment: Alignment.center,
          child: Container(
            padding: EdgeInsets.all(50),
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 25.0),
                    child: TextFormField(
                      controller: _userController,
                      validator: (value) {
                        if(value== null || value.isEmpty){
                          return 'please enter Your momo name';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        hintText: "enter your momo name",
                        icon: Icon(Icons.verified_user_outlined),
                      ),
                    ),
                  ),
                  Container(
                    child: TextFormField(
                      controller: _numController,
                      validator: (value) {
                        if(value== null || value.isEmpty || value.length<9){
                          return 'please enter Your valid momo number';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        hintText: "enter your momo number",
                        icon: Icon(Icons.verified_user_outlined),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 25.0),
                    child:
                        CheckboxListTile(
                          value: _checkBox,
                          title: Text("Business Account"),
                          controlAffinity: ListTileControlAffinity.leading,
                          onChanged: (val) {
                            setState(() {
                              _checkBox = val;
                              isVisible = ! isVisible;
                            });
                          },
                        ),
                  ),
                  Visibility(
                    visible: isVisible ,
                    child: Container(
                      child: TextFormField(
                        controller: _companyController,
                        decoration: const InputDecoration(
                          hintText: "Enter Your Comapny Name",
                          icon: Icon(Icons.verified_user_outlined),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 30.0),
                    child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            minimumSize: const Size(150, 50)),
                        onPressed: () {
                          if(_formKey.currentState!.validate()){
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return Dashboard2(
                                    userNum: _numController.text,
                                    userName: _userController.text,
                                  );
                                },
                              ),
                            );
                          }
                        },
                        child: Text(
                          "submit",
                          style: TextStyle(fontSize: 23, color: Colors.green),
                        )),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
