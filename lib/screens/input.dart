import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputScreen extends StatefulWidget {
  @override
  _InputScreenState createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {

  TimeOfDay originalSleepTime, finalSleepTime;
  int sleepDuration, shiftDuration;

  @override
  void initState(){
    super.initState();
    originalSleepTime = TimeOfDay.now();
    finalSleepTime = TimeOfDay.now();
    sleepDuration= 8; //hours
    shiftDuration = 3; //days
  }

  _pickoriginalTime() async {
    TimeOfDay t = await showTimePicker(
        context: context,
        initialTime: originalSleepTime
    );
    if(t != null)
      setState(() {
        originalSleepTime = t;
      });
  }

  _pickfinalTime() async {
    TimeOfDay t = await showTimePicker(
        context: context,
        initialTime: finalSleepTime
    );
    if(t != null)
      setState(() {
        finalSleepTime = t;
      });
  }

  Widget Field(String label){
    return Container(
      margin: EdgeInsets.only(top: 50, left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("$label\n",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w100,
            ),
          ),
          TextField(
            keyboardType: TextInputType.number,
            onChanged: (val){
              sleepDuration = int.parse(val);
            },
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                borderSide: BorderSide(color: Colors.grey),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                borderSide: BorderSide(color: Theme.of(context).accentColor),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget FieldShift(String label){
    return Container(
      margin: EdgeInsets.only(top: 50, left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("$label\n",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w100,
            ),
          ),
          TextField(
            keyboardType: TextInputType.number,
            onChanged: (val){
              shiftDuration = int.parse(val);
            },
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                borderSide: BorderSide(color: Colors.grey),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                borderSide: BorderSide(color: Theme.of(context).accentColor),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget Picker(String label){
    return Container(
      margin: EdgeInsets.only(top: 70, left: 20, right: 20),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: Text("$label\n",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w100,
              ),
            ),
          ),

          InkWell(
            onTap: _pickoriginalTime,
            child: Container(
                padding: EdgeInsets.only(top: 10, bottom: 10, right: 20, left: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  border: Border.all(color: Colors.grey),
                ),
                child: Text("${originalSleepTime.hour}:${originalSleepTime.minute}",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w100,
                  ),
                ),
            ),
          ),

        ],
      ),
    );
  }

  Widget PickerFinal(String label){
    return Container(
      margin: EdgeInsets.only(top: 70, left: 20, right: 20),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: Text("$label\n",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w100,
              ),
            ),
          ),

          InkWell(
            onTap: _pickfinalTime,
            child: Container(
              padding: EdgeInsets.only(top: 10, bottom: 10, right: 20, left: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                border: Border.all(color: Colors.grey),
              ),
              child: Text("${finalSleepTime.hour}:${finalSleepTime.minute}",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w100,
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }

  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            leading: IconButton(
              icon: Icon(Icons.close,size: 30),
              onPressed: (){
                Navigator.pop(context);
              },
            ),
          ),

          body: ListView(
            children: [
              Picker("Original Sleep Time"),
              PickerFinal("Final Sleep Time"),
              Field("Sleep Duration"),
              FieldShift("Shift Duration"),


              InkWell(
                onTap: (){
                  print("$originalSleepTime, $finalSleepTime, $sleepDuration, $shiftDuration");
                },
                child: Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width*0.8,
                    margin: EdgeInsets.only(top: 50),
                    padding: EdgeInsets.only(top: 20, bottom: 20, left: 50, right: 50),
                    decoration: BoxDecoration(
                      color: Theme.of(context).accentColor,
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    ),
                    child: Text("Create Schedule",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}

