import 'package:flutter/material.dart';


class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => new _SignupPageState();
}


class _SignupPageState extends State<SignupPage> {

  String _firstName;
  String _lastName;
  String _email;
  String _password;
  String _phone;

  final formKey = new GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text('Sign up'),
        actions: <Widget>[
          new IconButton(icon: const Icon(Icons.save), onPressed: () {})
        ],
      ),
      body: new Container(
          padding: EdgeInsets.all(16.0),
          child: new Form(
              key: formKey,
              child: new ListView(
//    crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  new TextFormField(
                    decoration: new InputDecoration( labelText: "First Name"),
                    validator: (value) => value.isEmpty ? 'Title can\'t be empty':null,
                    onSaved: (value) => _firstName = value,
                  ),
                  new TextFormField(
                    decoration: new InputDecoration( labelText: "Last Name"),
                    validator: (value) => value.isEmpty ? 'Text can\'t be empty':null,
                    onSaved: (value) => _lastName = value,
                  ),
                  new TextFormField(
                      decoration: new InputDecoration( labelText: "email"),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) => value.isEmpty ? 'Price can\'t be empty':null,
                      onSaved: (value) => _email = value //value as int,
                  ),
                  new TextFormField(
                      decoration: new InputDecoration( labelText: "password"),
                      obscureText: true,
                      validator: (value) => value.isEmpty ? 'Price can\'t be empty':null,
                      onSaved: (value) => _password = value //value as int,
                  ),
                  new TextFormField(
                      decoration: new InputDecoration( labelText: "phone"),
                      obscureText: true,
                      validator: (value) => value.isEmpty ? 'Price can\'t be empty':null,
                      onSaved: (value) => _phone = value //value as int,
                  ),
                  new RaisedButton(
                    child: new Text("Submit", style: new TextStyle(fontSize: 20.0)),
                    onPressed: (){},
                  )
                ],
              )
          )
      ),
    );
  }
}
