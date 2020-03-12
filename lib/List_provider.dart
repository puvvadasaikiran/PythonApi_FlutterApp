import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './constants.dart';
import 'package:http/http.dart' as http;

class ListProvider with ChangeNotifier {
  static const herokuUrl = 'https://still-beach-99010.herokuapp.com/pythonapi/';

  String user = '';

  String forAnalysis = "";

  static const String _url =
      'https://incomepredictoraj.firebaseio.com/userdata.json';

  Map<String, String> selectedOptions = {
    'age': '',
    'workclass': '',
    'education': '',
    'maritialstatus': '',
    'occupation': '',
    'relationship': '',
    'race': '',
    'sex': 'Female',
    'capitalgains': '',
    'capitalloss': '',
    'hoursperweek': '',
    'country': '',
  };

  Map<String, List<String>> parsableIndex = {
    'workclass': ConstantList.workclass,
    'education': ConstantList.education,
    'maritialstatus': ConstantList.maritialstatus,
    'occupation': ConstantList.occupation,
    'relationship': ConstantList.relationship,
    'race': ConstantList.race,
    'sex': ConstantList.sex,
    'country': ConstantList.country
  };

  List<String> indexedQuery = [];

  void setOptions(String option, String value) {
    if (option == 'hoursperweek') {
      print(selectedOptions);
    }
    selectedOptions[option] = value;
  }

  Future<void> storeDatatoFirebase() async {
    http.post(_url, body: json.encode(selectedOptions));
    await converter();
  }

  Future<void> converter() async {
    parsableIndex.forEach((value, valueList) {
      indexedQuery.add((valueList.indexOf(selectedOptions[value])).toString());
    });
    indexedQuery.insert(0, selectedOptions['age']);
    indexedQuery.insert(
        indexedQuery.length - 1, selectedOptions['capitalgains']);
    indexedQuery.insert(
        indexedQuery.length - 1, selectedOptions['capitalloss']);
    indexedQuery.insert(
        indexedQuery.length - 1, selectedOptions['hoursperweek']);
  }

  Future<String> get herokuResult async {
    String localanalysis = await indexedQueryforAnalysis;
    http.Response response = await http.get(herokuUrl + localanalysis);

    return json.decode(response.body)['result'].toString();
  }

  void resetValues() {
    selectedOptions = {
      'age': '',
      'workclass': '',
      'education': '',
      'maritialstatus': '',
      'occupation': '',
      'relationship': '',
      'race': '',
      'sex': 'Female',
      'capitalgains': '',
      'capitalloss': '',
      'hoursperweek': '',
      'country': '',
    };
  }

  String get userName {
    return user;
  }

  void setUser(String userName) {
    user = userName;
    notifyListeners();
  }

  String get indexedQueryforAnalysis {
    // String forAnalysis = "";
    for (var i = 0; i < indexedQuery.length; i++) {
      forAnalysis = forAnalysis + indexedQuery[i] + '_';
    }
    //print(forAnalysis);
    indexedQuery = [];
    return forAnalysis;
  }

  List<DropdownMenuItem> buildList({String listname}) {
    return ConstantList()
        .getList(name: listname)
        .map<DropdownMenuItem<String>>((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Container(
          padding: EdgeInsets.only(left: 5),
          child: Text(
            value,
            style: TextStyle(
              color: Color(0xFF000000), // Colors.black54,
            ),
          ),
        ),
      );
    }).toList();
  } //buildList
}
