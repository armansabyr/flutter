import 'package:flutter/material.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';

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

  void validateAndSave(){
    final form = formKey.currentState;
    if (form.validate()){
      form.save();
      print('First name $_firstName, email $_email');

      var url = 'http://method-marketplace.herokuapp.com/signup';
      var client = new http.Client();
      var request = new http.Request('POST', Uri.parse(url));
      var bytes = UTF8.encode(_password);
      var base64 = BASE64.encode(bytes);
      var body = {'email': _email, 'phone': _phone, 'first': _firstName,
      'last': _lastName, 'enc_pass': base64};
      request.headers[HttpHeaders.CONTENT_TYPE] = 'application/json; charset=utf-8';
      request.body = json.encode(body);
      var current = client.send(request).then( (response)
        => response.stream.bytesToString().then((value)
          =>print(value))).catchError((error)=> print(error.toString())) ;
      print(value['ok'])
    }
  }
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
                      validator: (value) => value.isEmpty ? 'Price can\'t be empty':null,
                      onSaved: (value) => _phone = value //value as int,
                  ),
                  new RaisedButton(
                    child: new Text("Submit", style: new TextStyle(fontSize: 20.0)),
                    onPressed: validateAndSave,
                  )
                ],
              )
          )
      ),
    );
  }
}
