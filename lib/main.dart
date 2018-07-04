import 'package:flutter/material.dart';
import 'signup.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(),
      initialRoute: '/login',
      routes: <String, WidgetBuilder> {
        '/login': (BuildContext context) => new LoginPage(),
        '/signup': (BuildContext context) => new SignupPage(),
      }
    );
  }
}

class MyHomePage extends StatefulWidget {

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: new Text("new app"),
      ),
      drawer: new Drawer(

      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class LoginPage extends StatefulWidget {

  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
  String _username;
  String _password;

  final formKey = new GlobalKey<FormState>();

    return new Scaffold(
      body: SafeArea(
        child: Form(
          key: formKey,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
            children: <Widget>[
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  labelText: 'Username',
                ),
                validator: (value) => value.isEmpty ? 'This field cannot be empty':null,
                onSaved: (value) => _username = value,
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  labelText: 'Password',
                ),
                obscureText: true,
                validator: (value) => value.isEmpty ? 'This field cannot be empty':null,
                onSaved: (value) => _password = value,
              ),
              SizedBox(
                height: 20.0,
              ),
              ButtonBar(
                children: <Widget>[
                  FlatButton(
                    child: Text('Sign up'),
                    onPressed: () {
                      button1(context);
                    }
                    ),
                  RaisedButton(
                    child: Text('SUBMIT'),
                    onPressed: null,
                  )
                ],

              )

            ],
          )
        ),

      )
    );
  }
}

void button1(BuildContext context){
  print("Button 1");
  Navigator.of(context).pushNamed('/signup');
}