import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class CreateUserPro extends ChangeNotifier {
  var sexvalue;
  
  update(String name) {
    sexvalue = name;
   
    notifyListeners();
  }
}
