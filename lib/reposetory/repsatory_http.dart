
import '../interface/sources/i_json_base_source.dart';
import '../utilis/models/base_data_model.dart';
import '../utilis/models/remote_base_model.dart';
import '../utilis/models/staus_model.dart';
import '../utilis/result/result.dart';

class ServiceCRUDHttpRepo<T extends BaseDataModel> {
  ICommerceResultBaseCRUDSource? _inputSource;
  ServiceCRUDHttpRepo(
      {ICommerceResultBaseCRUDSource<T> ? inputSource}) {
    _inputSource = inputSource;
  }
  Future<Result<RemoteBaseModel, dynamic>> addData() async {
    try {
      var result = await _inputSource!.addDataItem();

      return Result().data(result);
    } catch (e) {
      return Result.error(
          RemoteBaseModel(message: e.toString(), status: StatusModel.error ));
    }
  }

  Future<Result<RemoteBaseModel, dynamic>> deleteData(
      String id) async {
    try {
      var result = await _inputSource!.deleteDataItem(id);

      return Result().data(result);
    } catch (e) {
      return Result.error(
          RemoteBaseModel(message: e.toString(), status:  StatusModel.error));
    }
  }

  Future<Result<RemoteBaseModel, RemoteBaseModel>>
      getAllData() async {
    var result = await _inputSource!.getDataList();

    return Result<RemoteBaseModel, RemoteBaseModel>(
        data: result.data, error: result.error);
  }

  Future<Result<RemoteBaseModel, Map<String, dynamic>>> getSingleData(
      String id) async {
    try {
      var result = await _inputSource!.getSingleData(id) as BaseDataModel;

      return Result(data: result.toJson());
    } catch (e) {
      return Result.error(
          RemoteBaseModel(message: e.toString(), status:  StatusModel.error));
    }
  }

  Future<Result<RemoteBaseModel, dynamic>> updateData(
      String id) async {
    try {
      var result = await _inputSource!.updateDataItem(
        id,
      );

      return Result().data(result);
    } catch (e) {
      return Result.error(
          RemoteBaseModel(message: e.toString(), status: StatusModel.error));
    }
  }
}
