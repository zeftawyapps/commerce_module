import 'package:commerce_module/utilis/models/staus_model.dart';

import '../interface/sources/i_json_base_source.dart';
import '../utilis/models/base_data_model.dart';
import '../utilis/models/remote_base_model.dart';
import '../utilis/result/result.dart';

class ServiceCRUDHttpRepo<T extends BaseDataModel> {
  ICommerceResultBaseCRUDSource? _inputSource;
  ServiceCRUDHttpRepo(
      {ICommerceResultBaseCRUDSource<T> ? inputSource}) {
    _inputSource = inputSource;
  }
  Future<CommerceResult<RemoteBaseModel, dynamic>> addData() async {
    try {
      var result = await _inputSource!.addDataItem();

      return CommerceResult().data(result);
    } catch (e) {
      return CommerceResult.error(
          RemoteBaseModel(message: e.toString(), status: StatusModel.error ));
    }
  }

  Future<CommerceResult<RemoteBaseModel, dynamic>> deleteData(
      String id) async {
    try {
      var result = await _inputSource!.deleteDataItem(id);

      return CommerceResult().data(result);
    } catch (e) {
      return CommerceResult.error(
          RemoteBaseModel(message: e.toString(), status:  StatusModel.error));
    }
  }

  Future<CommerceResult<RemoteBaseModel, RemoteBaseModel>>
      getAllData() async {
    var result = await _inputSource!.getDataList();

    return CommerceResult<RemoteBaseModel, RemoteBaseModel>(
        data: result.data, error: result.error);
  }

  Future<CommerceResult<RemoteBaseModel, Map<String, dynamic>>> getSingleData(
      String id) async {
    try {
      var result = await _inputSource!.getSingleData(id) as BaseDataModel;

      return CommerceResult(data: result.toJson());
    } catch (e) {
      return CommerceResult.error(
          RemoteBaseModel(message: e.toString(), status:  StatusModel.error));
    }
  }

  Future<CommerceResult<RemoteBaseModel, dynamic>> updateData(
      String id) async {
    try {
      var result = await _inputSource!.updateDataItem(
        id,
      );

      return CommerceResult().data(result);
    } catch (e) {
      return CommerceResult.error(
          RemoteBaseModel(message: e.toString(), status: StatusModel.error));
    }
  }
}
