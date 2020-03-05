import 'package:flutter/material.dart';
import 'package:income_predictor/List_provider.dart';
import 'package:income_predictor/result_screen.dart';
import 'package:income_predictor/widgets/flat_button.dart';
import 'package:income_predictor/widgets/text_field.dart';
import 'package:provider/provider.dart';

import 'widgets/drop_down.dart';
import 'widgets/text_field_block.dart';

void main() => runApp(
      MyApp(),
    );

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = '';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ListProvider>.value(
      value: ListProvider(),
      child: MaterialApp(
        routes: {
          ResultScreen.routeName: (ctxt) => ResultScreen(),
          MyStatefulWidget.routeName: (ctxt) => MyStatefulWidget(),
        },
        debugShowCheckedModeBanner: false,
        title: _title,
        home: MyStatefulWidget(),
        theme: ThemeData(
          unselectedWidgetColor: Colors.white,
          accentColor: Colors.green,
          primaryColor: Colors.green,
        ),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  static const routeName = 'home';

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  String dropdownValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Positioned(
            left: MediaQuery.of(context).size.width * 0.3,
            top: -MediaQuery.of(context).size.width * 1.2,
            child: Container(
              height: MediaQuery.of(context).size.height * 1.2,
              width: MediaQuery.of(context).size.width * 1.2,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.cyan //Color(0xDF000000),
                  ),
            ),
          ),
          SingleChildScrollView(
            physics: ScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            child: SafeArea(
              child: Container(
                margin:
                    EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height * 0.3,
                      alignment: Alignment.bottomLeft,
                      margin: EdgeInsets.only(bottom: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            "Income",
                            style: TextStyle(
                                fontSize: 50, fontWeight: FontWeight.bold),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Text(
                                "Predictor",
                                style: TextStyle(
                                    fontSize: 50, fontWeight: FontWeight.bold),
                              ),

                              Container(
                                margin: EdgeInsets.only(bottom: 10, left: 2),
                                height: 12,
                                width: 12,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.cyan //Color(0xDF000000),
                                    ),
                              ),
                              // Text(
                              //   ".",
                              //   style: TextStyle(
                              //       fontSize: 50,
                              //       fontWeight: FontWeight.bold,
                              //       color: Colors.cyan),
                              // ),
                            ],
                          )
                        ],
                      ),
                    ),
                    DropDownWidget(
                      hintText: 'Work Class',
                      listName: 'workclass',
                    ),
                    DropDownWidget(
                      hintText: 'Maritial Status',
                      listName: 'maritialstatus',
                    ),
                    DropDownWidget(
                      hintText: 'Education',
                      listName: 'education',
                    ),
                    DropDownWidget(
                      hintText: 'Race',
                      listName: 'race',
                    ),
                    DropDownWidget(
                      hintText: 'Country',
                      listName: 'country',
                    ),
                    DropDownWidget(
                      hintText: 'Relationship',
                      listName: 'relationship',
                    ),
                    DropDownWidget(
                      hintText: 'Occupation',
                      listName: 'occupation',
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: TextFieldBlock(
                            textField: 'Age',
                            maxLenthText: 2,
                            hintText: '32',
                            listname: 'age',
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(child: TextFieldCollector())
                      ],
                    ),
                    TextFieldBlock(
                      textField: 'Capital Gains',
                      maxLenthText: 8,
                      hintText: 'in USD',
                      listname: 'capitalgains',
                    ),
                    TextFieldBlock(
                      textField: 'Capital Loss',
                      maxLenthText: 8,
                      hintText: 'in USD',
                      listname: 'capitalloss',
                    ),
                    TextFieldBlock(
                      textField: 'Hours per Week',
                      maxLenthText: 2,
                      hintText: '42',
                      listname: 'hoursperweek',
                    ),
                    SizedBox(height: 10),
                    FlatButtonWidget(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
