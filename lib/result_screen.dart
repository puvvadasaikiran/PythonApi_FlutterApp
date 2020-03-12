import 'package:flutter/material.dart';
import 'package:income_predictor/List_provider.dart';
import 'package:income_predictor/user_details_form_screen.dart';
import 'package:provider/provider.dart';

class ResultScreen extends StatelessWidget {
  static const String routeName = '/resultsScreen';
  var result;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Provider.of<ListProvider>(context, listen: false).resetValues();
        Navigator.of(context).pushReplacementNamed(MyStatefulWidget.routeName);
      },
      child: Scaffold(
        backgroundColor: Color.fromRGBO(143, 148, 251, 1),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                height: MediaQuery.of(context).size.height * 0.4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Expected Income',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height -
                    MediaQuery.of(context).size.height * 0.4,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(80),
                  ),
                ),
                child: Center(
                  child: FutureBuilder(
                    future: Provider.of<ListProvider>(context).herokuResult,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return FittedBox(
                          child: Text(
                            '${snapshot.data}',
                            style: TextStyle(
                                fontSize: 90,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87),
                          ),
                        );
                      } else {
                        return CircularProgressIndicator();
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color.fromRGBO(143, 148, 251, 1),
          child: Icon(Icons.home),
          onPressed: () {
            Provider.of<ListProvider>(context, listen: false).resetValues();
            Navigator.of(context)
                .pushReplacementNamed(MyStatefulWidget.routeName);
          },
        ),
      ),
    );
  }
}
