import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../List_provider.dart';

enum Sex {
  Male,
  Female,
}

class TextFieldCollector extends StatefulWidget {
  @override
  _TextFieldCollectorState createState() => _TextFieldCollectorState();
}

class _TextFieldCollectorState extends State<TextFieldCollector> {
  @override
  var radioActive = Sex.Female;

  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      height: 180,
      width: MediaQuery.of(context).size.width - 30,
      decoration: BoxDecoration(
          border: Border.all(
              width: 1,
              color: Color(0x09000000), //Color(0xFF000000), //Color(0x7F6CA8F1),
            ),
          borderRadius: BorderRadius.circular(15),
          color: Colors.white //Color(0xFF6CA8F1),
          ),
      padding: EdgeInsets.only(top: 20, bottom: 10),
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
                color: Colors.black, borderRadius: BorderRadius.circular(20)),
            child: RadioListTile(
              value: Sex.Female,
              activeColor: Colors.white,

              groupValue: radioActive,
              onChanged: (Sex value) {
                setState(() {
                  radioActive = Sex.Female;
                  Provider.of<ListProvider>(context, listen: false)
                      .setOptions('sex', 'Female');
                });
              },
              // selected: true,
              title: Text(
                'Female',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
                color: Colors.black, borderRadius: BorderRadius.circular(20)),
            child: RadioListTile(
              activeColor: Colors.white,
              value: Sex.Male,
              groupValue: radioActive,
              onChanged: (Sex value) {
                setState(() {
                  radioActive = Sex.Male;
                  Provider.of<ListProvider>(context, listen: false)
                      .setOptions('sex', 'Male');
                });
              },
              title: Text(
                'Male',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
