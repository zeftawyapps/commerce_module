import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:commerce_module/utilis/models/base_data_model.dart';
import 'package:commerce_module/utilis/models/base_model.dart';
import 'package:commerce_module/utilis/result/result.dart';

abstract class ICommerceUploadSource<T extends ICommerceBaseDataModel   > {

  Future   addDataRowWithUpload( File?file ,String? imagfileld  );
  Future   updateDataRowWithUplaod(   String id , File?file ,String? imagfileld  );
  Future   updateDataRowWithUplaodRepcament(   String id , File?file ,String? imagfileld  );

}