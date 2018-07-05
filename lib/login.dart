import 'package:flutter/material.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}


class _LoginPageState extends State<LoginPage> {

  String _email;
  String _password;

  final formKey = new GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      body: new Container(
          padding: EdgeInsets.symmetric(vertical:80.0, horizontal: 0.0),
          child: new Form(
              key: formKey,
              child: new ListView(
//    crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  new TextFormField(
                    decoration: new InputDecoration( labelText: "First Name"),
                    validator: (value) => value.isEmpty ? 'Title can\'t be empty':null,
                    onSaved: (value) => _email = value,
                  ),
                  new TextFormField(
                    decoration: new InputDecoration( labelText: "Last Name"),
                    validator: (value) => value.isEmpty ? 'Text can\'t be empty':null,
                    onSaved: (value) => _password = value,
                  ),
                  ButtonBar(
                    children: <Widget>[
                      new FlatButton(
                        child: new Text("Sign up", style: new TextStyle(fontSize: 20.0)),
                        onPressed: (){
                          button1(context);
                        },
                      ),
                      new RaisedButton(
                        child: new Text("Log in", style: new TextStyle(fontSize: 20.0)),
                        onPressed: (){},
                      )
                    ],
                  )

                ],
              )
          )
      ),
    );
  }
}

void button1(BuildContext context){
  print("Button 1");
  Navigator.of(context).pushNamed('/signup');
}