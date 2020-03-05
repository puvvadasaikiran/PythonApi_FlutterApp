import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../List_provider.dart';
import '../result_screen.dart';

class FlatButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
        onPressed: () async {
          await Provider.of<ListProvider>(context, listen: false)
              .storeDatatoFirebase();

          Navigator.of(context).pushReplacementNamed(ResultScreen.routeName);
        },
        
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Color(0xFF000000),
          ),
          padding: EdgeInsets.all(20),
          width: MediaQuery.of(context).size.width,
          child: Text(
            'Submit',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
            ),
            textAlign: TextAlign.center,
          ),
        ));
  }
}
