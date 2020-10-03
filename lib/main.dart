import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:snoozeshift/screens/loginpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of the application.
        primarySwatch: Colors.blue,


        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,

        brightness: Brightness.dark,
        backgroundColor: Color(0xff080808),
        primaryColor: Colors.black,
        accentColor: Color(0xffecceb4),

      ),
      //home: _getLandingPage(),
      home: MyHomePage(),
    );
  }

  Widget _getLandingPage() {
    return StreamBuilder<FirebaseUser>(
        stream: FirebaseAuth.instance.onAuthStateChanged,
        builder: (BuildContext context, snapshot){
          if(snapshot.hasData)
            return MyHomePage();
          else
            return LoginPage();
        }
    );
  }
}


class MyHomePage extends StatefulWidget {
  MyHomePage();

  @override
  _MyHomePageState createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  List choices = [
    "Flight",
    "Spaceflight",
    "Shift Work",
  ];

  void _addroutine() {
    setState(() {
      _counter++;
    });
  }

  List <String>greetings = [
    "Hi",
    "Hey",
    "Greetings",
    "Hola!",
  ];


  @override
  Widget build(BuildContext context) {

    final _random = new Random();
    var element = greetings[_random.nextInt(greetings.length)];


    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
        child: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 50, left: 20),
              child: Text(
                '$element John,',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 34,
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.only(top: 50, left: 20),
              child: Text("You don't have any sleep shift routines yet.",
                style: TextStyle(
                  fontSize: 20,
                  color: Theme.of(context).accentColor,
                ),
              ),
            ),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
      )
    );
  }
}
