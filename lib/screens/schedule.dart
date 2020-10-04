import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class GanttColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*0.1,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.yellow,
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
      ),
    );
  }
}


class Schedule extends StatefulWidget {
  @override
  _ScheduleState createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
          ),

          actions: [
            Text("Delhi, IN",
              style: TextStyle(
                color: Theme.of(context).accentColor,
              ),
            )
          ],
        ),

        body: ListView(
          children: [
            Text("Your Sleep Alignment Schedule"),
            Text("Follow this as closely as possible for maximum effect"),

            Column(
              children: [
                Container(),


              ],
            ),
          ],
        ),
      ),
    );
  }
}
