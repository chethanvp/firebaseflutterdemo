import "package:flutter/material.dart";

class AuthPage extends StatefulWidget{

  @override
  _AuthPage createState() => _AuthPage();
}

class _AuthPage extends State<AuthPage>{

    final formKey = new GlobalKey<FormState>();

      String _email;
      String _pass;
    void validateAndSave(){
      print("inside function");

      final form = formKey.currentState;
      print("form" + form.toString());
      if(form.validate()){
        print("sucess");
      }
      else{
        print("failed");
      }
    }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text(
          "login page"
        ),
      ),
      body: Container(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: "Email"),
                validator: (value)=> value.isEmpty? "enter email" : null,
                onSave
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "password"),
                validator: (value)=> value.isEmpty ? "enter password" : null ,
                obscureText: true,
              ),
              RaisedButton(
                onPressed: validateAndSave,
                child: Text("login"),
              )
            ],
          ),
        ),
      ),
    );
  }
}