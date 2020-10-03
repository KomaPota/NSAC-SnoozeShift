import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:snoozeshift/sign_in.dart';
import 'package:snoozeshift/main.dart';

bool accept = true;

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(),

            Center(
                child: Image.asset('images/snoozelogo.png',
                height: 300.0,
                ),
            ),

            _signInButton(),
          ],
        ),
      ),
    );
  }
}


class _signInButton extends StatelessWidget
{
  Widget build(BuildContext context)
  {
    return UnconstrainedBox(
//      margin: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.15, right: MediaQuery.of(context).size.width*0.15),
      child: FlatButton(
        splashColor: Colors.grey,
        onPressed: () {
          if(accept)
            signInWithGoogle().whenComplete(() {
              Navigator.push(
                  context,
                  new CupertinoPageRoute(builder: (context) => MyHomePage())
              );
            });
          else
            Scaffold.of(context).showSnackBar(
              SnackBar(
                duration: Duration(milliseconds: 2000),
                backgroundColor: Colors.pink[600],
                content: Text("Please accept the Terms of Usage",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    //fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),

              ),
            );
        },
        color: Theme.of(context).accentColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(80)
        ),


        child: Padding(
          padding: const EdgeInsets.only(left: 0, top: 10, right: 0, bottom: 10),
          child: Row(
//            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                ),
                child: Image(
                  image: AssetImage("images/google_logo.png",
                  ),
                  height: 35.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  'Sign in',
                  style: TextStyle(
                    fontSize: 23,
                    color: Colors.grey[800],
                    fontWeight: FontWeight.w700,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}