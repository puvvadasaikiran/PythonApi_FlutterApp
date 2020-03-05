import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../List_provider.dart';

class TextFieldBlock extends StatelessWidget {
  final String textField;
  final int maxLenthText;
  final String hintText;
  final String listname;

  TextFieldBlock(
      {Key key,
      this.textField,
      this.maxLenthText,
      this.hintText,
      this.listname})
      : super(key: key);

  // final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: MediaQuery.of(context).size.width - 30,
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: Colors.black, //Color(0xFF000000), //Color(0x7F6CA8F1),
        ),
        borderRadius: BorderRadius.circular(15),
        color: Colors.white, // Colors.black,//Color(0xFF6CA8F1),
      ),
      padding: EdgeInsets.only(top: 20, bottom: 10),
      child: Center(
        child: Column(
          children: <Widget>[
            Text(
              textField,
              style: TextStyle(
                  fontSize: 50,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            TextField(
              style: TextStyle(
                color: Colors.black,
                fontSize: 65,
                fontWeight: FontWeight.bold,
              ),
              //  controller: _controller,
              cursorColor: Colors.white,
              keyboardType: TextInputType.number,
              maxLength: maxLenthText,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  counterText: "",
                  hintText: hintText,
                  hintStyle: TextStyle(color: Color(0x20000000))),
              textAlign: TextAlign.center,
              onChanged: (String value) {
                Provider.of<ListProvider>(context, listen: false)
                    .setOptions(listname, value);
              },
            ),
          ],
        ),
      ),
      margin: EdgeInsets.only(bottom: 15),
    );
  }
}
