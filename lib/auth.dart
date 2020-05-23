import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasedemo/homepage.dart';
import "package:flutter/material.dart";


class AuthPage extends StatefulWidget{

  @override
  _AuthPage createState() => _AuthPage();
}

enum formType{
  login,reg
}

class _AuthPage extends State<AuthPage>{

    final formKey = new GlobalKey<FormState>();
    formType ftype = formType.login;

      String _email;
      String _pass;
    bool validateAndSave(){
      print("inside function");

      final form = formKey.currentState;
      print("form" + form.toString());
      if(form.validate()){
        form.save();
        print("sucess");
        print("email: " + _email  + "\n" + "password: " + _pass);
        return true;
      }
      else{
        print("failed");
        return false;
      }
      
    }

    void validateAndSubmit() async {
        if(validateAndSave()){
          try{
            AuthResult user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _pass);
            print("user: " + user.user.email.toString());
            if(user.user.uid != null){
              print("hi");
              Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => HomePage()),
  );
            }
          }
          catch(e){
            print("error: " + e.toString());
          }
        }
    }

    @override
    void initState(){
      super.initState();

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
                onSaved: (value) => _email = value,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "password"),
                validator: (value)=> value.isEmpty ? "enter password" : null ,
                onSaved: (value) => _pass = value,
                obscureText: true,
              ),
              RaisedButton(
                onPressed: validateAndSubmit,
                child: Text("login"),
              ),
              RaisedButton(
                onPressed: validateAndSave,
                child: Text("register"),
              )
            ],
          ),
        ),
      ),
    );
  }
}