class ConstantList {
  static const List<String> workclass = [
    'Federal-gov',
    'Local-gov',
    'Student',
    'Private',
    'Self-emp-inc',
    'Self-emp-not-inc',
    'State-gov',
    'Without-pay',
    'private'
  ];

  static const List<String> maritialstatus = [
    'Divorced',
    'Married-AF-spouse',
    'Married-civ-spouse',
    'Married-spouse-absent',
    'Never-married',
    'Separated',
    'Widowed'
  ];

  static const List<String> education = [
    '10th',
    '11th',
    '12th',
    '1st-4th',
    '5th-6th',
    '7th-8th',
    '9th',
    'Assoc-acdm',
    'Assoc-voc',
    'Bachelors',
    'Doctorate',
    'HS-grad',
    'Masters',
    'Preschool',
    'Prof-school',
    'Some-college'
  ];

  static const List<String> occupation = [
    'Adm-clerical',
    'Armed-Forces',
    'Craft-repair',
    'Exec-managerial',
    'Farming-fishing',
    'Handlers-cleaners',
    'Machine-op-inspct',
    'Other-service',
    'Priv-house-serv',
    'Prof-speciality',
    'Prof-specialty',
    'Protective-serv',
    'Sales',
    'Tech-support',
    'Transport-moving'
  ];

  static const List<String> relationship = [
    'Husband',
    'Not-in-family',
    'Other-relative',
    'Own-child',
    'Unmarried',
    'Wife'
  ];

  static const List<String> race = [
    'Amer-Indian-Eskimo',
    'Asian-Pac-Islander',
    'Black',
    'Other',
    'White'
  ];

  static const List<String> country = [
    'Cambodia',
    'Canada',
    'China',
    'Columbia',
    'Cuba',
    'Dominican-Republic',
    'Ecuador',
    'El-Salvador',
    'England',
    'France',
    'Germany',
    'Greece',
    'Guatemala',
    'Haiti',
    'Holand-Netherlands',
    'Honduras',
    'Hong',
    'Hungary',
    'India',
    'Iran',
    'Ireland',
    'Italy',
    'Jamaica',
    'Japan',
    'Laos',
    'Mexico',
    'Nicaragua',
    'Outlying-US(Guam-USVI-etc)',
    'Peru',
    'Philippines',
    'Poland',
    'Portugal',
    'Puerto-Rico',
    'Scotland',
    'South',
    'Taiwan',
    'Thailand',
    'Trinadad&Tobago',
    'United-States',
    'Vietnam',
    'Yugoslavia'
  ];

  static const List<String> sex = ['Female', 'Male'];

  List<String> getList({String name}) {
    if (name == 'education') {
      return [...education];
    }
    if (name == 'maritialstatus') {
      return [...maritialstatus];
    }
    if (name == 'race') {
      return [...race];
    }
    if (name == 'country') {
      return [...country];
    }
    if (name == 'relationship') {
      return [...relationship];
    }

    if (name == 'occupation') {
      return [...occupation];
    }

    if (name == 'workclass') {
      return [...workclass];
    }

    return [];
  }
}
