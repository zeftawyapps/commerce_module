library users_module;

import 'package:cloud_firestore/cloud_firestore.dart';

/// A Calculator.
class JoDijaTestConnection {
  void  test(){

    FirebaseFirestore.instance.collection("testCommerce").add(({"tested":true}));
  }
}
