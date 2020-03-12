import 'package:flutter/material.dart';
import 'package:income_predictor/List_provider.dart';
import 'package:income_predictor/result_screen.dart';
import 'user_details_form_screen.dart';
import 'package:provider/provider.dart';
import 'login_screen.dart';

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
        home: MyHomePage(),
        theme: ThemeData(
          unselectedWidgetColor: Colors.white,
          accentColor: Colors.green,
          primaryColor: Colors.green,
        ),
      ),
    );
  }
}
