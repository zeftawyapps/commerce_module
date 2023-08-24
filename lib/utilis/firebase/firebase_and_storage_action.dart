import 'dart:io';

import 'package:flutter/cupertino.dart';

import 'firestore_inputs.dart';
import 'storage.dart';

class FirestoreAndStorageActions extends FireStoreAction with StorageActions {
  Future<dynamic> editeDataCloudFirestorWithUpload(
      {required String collection,
      required String id,
      required Map<String, dynamic> mymap,
      File? file,
      String? filedowloadurifieldname = "imguri"}) async {
    var data = await editDataCloudFirestore(
        id: id, collection: collection, mymap: mymap);

    if (file != null) {
      await uploadDataStoreage(file);
      String download = await downloadURLStoreage();

      data = await editDataCloudFirestore(
          collection: collection,
          id: id,
          mymap: {filedowloadurifieldname!: download});
    }
    return data;
  }

  Future<dynamic> editeDataCloudFirestorWithUploadSubCollection(
      {required String collection,
      required String docId,
      required String subcollection,
      required String id,
          String? image="imageUrl",
      required Map<String, dynamic> mymap,
      File? file,
      }) async {
    var data = await editDataCloudFirestoreSubColletion(
        subCollection: subcollection,
        docId: docId,
        id: id,
        collection: collection,

        mymap: mymap);

    if (file != null) {
      await uploadDataStoreage(file);
      String download = await downloadURLStoreage();

      data = await editDataCloudFirestoreSubColletion(
          subCollection: subcollection,
          docId: docId,
          collection: collection,
          id: id,
          mymap: {image!: download});
    }
    return data;
  }

  Future<String> addDataCloudFirestorWithUpload(
      {required String collection,
      String? id,
      required Map<String, dynamic> mymap,
      File? file,
      String dir = "",
      String? filedowloadurifieldname = "imguri"}) async {
    String iddoc = await addDataCloudFirestore(
        id: id, collection: collection, mymap: mymap);

    if (file != null) {
      await uploadDataStoreage(file);
      String download = await downloadURLStoreage();
String docId ;
      if (id == null || id == ""){
        docId = iddoc ;
      }else {
        docId = id ;
      }
      editDataCloudFirestore(
          collection: collection,
          id: docId,
          mymap: {filedowloadurifieldname!: download});
    }
    return iddoc;
  }

  Future<String> addDataCloudFirestorWithUploadSubCollection(
      {required String collection,
      String? id,
      required Map<String, dynamic> mymap,
      File? file,
      String dir = "",
      required String subcollection,
      required String docId,

      String? imageField = "imguri"}) async {
    String iddoc = await addDataCloudFirestoreSupCollection(
        subCollection: subcollection,
        docId: docId,
        id: id,
        collection: collection,
        mymap: mymap);

    if (file != null) {
      await uploadDataStoreage(file);
      String download = await downloadURLStoreage();

      editDataCloudFirestoreSubColletion(
          subCollection: subcollection,
          docId: docId,
          collection: collection,
          id: id ?? iddoc,
          mymap: {imageField!: download});
    }
    return iddoc;
  }

  Future<void> editeDataCloudFirestorWithUploadAndReplacementSubCollection(
      {required String collection,
      String dir = "",
      required String id,
      required String subcollection,
      required String docid,
      required Map<String, dynamic> mymap,
      File? file,
      String? iamgeField = "imguri",
      String? oldurl}) {
    return editDataCloudFirestoreSubColletion(
            id: id,
            subCollection: subcollection,
            collection: collection,
            mymap: mymap,
            docId: docid)
        .then((value) {
      if (file != null) {
        if (oldurl != "") {
          deleteDataStoreagefromurl(url: oldurl!);
        }
        uploadDataStoreage(file, dir: dir).then((value) {
          downloadURLStoreage().then((value) {
            editDataCloudFirestoreSubColletion(
                subCollection: subcollection,
                docId: docid,
                collection: collection,
                id: id,
                mymap: {iamgeField!:  value});
          });
        });
      }
    });
  }

  Future<void> editeDataCloudFirestorWithUploadAndReplacement(
      {required String collection,
      String dir = "",
      required String id,
      required Map<String, dynamic> mymap,
      File? file,
      String? filedowloadurifieldname = "imguri",
      String? oldurl}) {
    return editDataCloudFirestore(
      id: id,
      collection: collection,
      mymap: mymap,
    ).then((value) {
      if (file != null) {
        if (oldurl != "") {
          deleteDataStoreagefromurl(url: oldurl!);
        }
        uploadDataStoreage(file, dir: dir).then((value) {
          downloadURLStoreage().then((value) {
            editDataCloudFirestore(
                collection: collection,
                id: id,
                mymap: {filedowloadurifieldname!: value});
          });
        });
      }
    });
  }
}
