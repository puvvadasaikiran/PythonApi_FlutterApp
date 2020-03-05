import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../List_provider.dart';

class DropDownWidget extends StatefulWidget {
  final hintText;
  final listName;

  const DropDownWidget({Key key, this.hintText, this.listName})
      : super(key: key);

  @override
  _DropDownWidgetState createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  @override
  var dropdownValue;
  var providerVar;

  @override
  void initState() {
    providerVar = Provider.of<ListProvider>(context, listen: false);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //TODO : hardcoded removal
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          widget.hintText,
          style: TextStyle(
              fontSize: 18,
              color: Color(0xFF000000), // Color(0xFF6CA8F1),
              fontWeight: FontWeight.w700),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              width: 2,
              color: Colors.black87, //Color(0xFF000000), //Color(0x7F6CA8F1),
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          alignment: Alignment.center,
          child: DropdownButton<String>(
            // hint: Text(widget.hintText),

            isExpanded: true,
            isDense: true,
            value: dropdownValue,
            icon: Icon(Icons.arrow_drop_down),
            iconEnabledColor: Color(0xFF000000), //Color(0xFF6CA8F1),
            iconSize: 42,
            elevation: 1,
            style: TextStyle(color: Colors.white, fontSize: 16),
            underline: SizedBox(),
            onChanged: (String newValue) {
              setState(() {
                dropdownValue = newValue;
                // print(dropdownValue);
                providerVar.setOptions(widget.listName, newValue);
              });
            },
            items: providerVar.buildList(listname: widget.listName),
          ),
        ),
        SizedBox(
          height: 15,
        )
      ],
    );
  }
}
