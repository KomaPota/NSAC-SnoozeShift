import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:snoozeshift/screens/input.dart';
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

  void _optionsModalBottomSheet(context){
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc){
          return Container(
            color: Colors.black,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topRight: Radius.circular(50.0), topLeft: Radius.circular(50.0)),
                color: Color(0xaa656565),
//                border: Border.all(color: Theme.of(context).accentColor),
              ),
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                    title: Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Text("Choose your Case",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Theme.of(context).accentColor,
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    thickness: 3,
                    color: Theme.of(context).accentColor,
                    indent: MediaQuery.of(context).size.width*0.45,
                    endIndent: MediaQuery.of(context).size.width*0.45,
                  ),
                  new ListTile(
                      leading: new Icon(Icons.star),
                      title: new Text('Spaceflight'),
                      onTap: () => {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(builder: (context)=>InputScreen()),
                      )}
                  ),
                  new ListTile(
                    leading: new Icon(Icons.flight),
                    title: new Text('Air Travel'),
                    onTap: () => {},
                  ),
                  new ListTile(
                    leading: new Icon(Icons.alarm),
                    title: new Text('Shift Work'),
                    onTap: () => {},
                  ),
                  new ListTile(
                    leading: new Icon(Icons.mood_bad),
                    title: new Text('Sleep Correction'),
                    onTap: () => {},
                  ),
                ],
              ),
            ),
          );
        }
    );
  }

  @override
  Widget build(BuildContext context1) {

    final _random = new Random();
    var element = greetings[_random.nextInt(greetings.length)];

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Icon(Icons.menu,
          size: 35,
          color: Color(0xffffffff),
        ),
      ),

      drawer: Drawer(

      ),

      body: Center(
        child: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 20, left: 20),
              child: Text(
                '$element Sara,',
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
        onPressed: (){
            _optionsModalBottomSheet(context);
          },
      )
    );
  }
}
