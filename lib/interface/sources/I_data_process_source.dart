import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:commerce_module/utilis/models/base_data_model.dart';
import 'package:commerce_module/utilis/models/base_model.dart';
import 'package:commerce_module/utilis/result/result.dart';

abstract class ICommerceSource<T extends ICommerceBaseDataModel   > {
T? data;
  Future   addDataRow(  );
  Future   updateDataRow(   String id  );
  Future   deleteDataRow(String  id);
 Future<  List<T>>  getAllDataList();
Future<  T >   getDataRow(String id);
Future<  List<T> >  getData( Query   query);

}