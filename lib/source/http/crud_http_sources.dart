import 'package:commerce_module/utilis/models/base_data_model.dart';
import 'package:commerce_module/utilis/models/staus_model.dart';
import 'package:commerce_module/utilis/result/result.dart';
import 'package:dio/dio.dart';
import '../../constes/education_api_urls.dart';
import '../../https/commerce_http_urls.dart';
import '../../interface/sources/i_json_base_source.dart';
import '../../utilis/http_remotes/http_client.dart';
import '../../utilis/http_remotes/http_methos_enum.dart';
import '../../utilis/models/remote_base_model.dart';


class AppCategoryHttpSources extends ICommerceResultBaseCRUDSource<BaseDataModel>   {
  BaseDataModel? data;
  MultipartFile? file;
  String imagfileld="image";
  // factory
  factory AppCategoryHttpSources.inputs(
      BaseDataModel dataModyle, MultipartFile? file) {
    return AppCategoryHttpSources()
      ..data = dataModyle
      ..file = file
      .. imagfileld = "image";
  }
  AppCategoryHttpSources();

  @override
  Future<CommerceResult<RemoteBaseModel, RemoteBaseModel<String>  >>
  addDataItem() async {
    if (file == null) {
      var result = await CommreceHttpClient(userToken: true)
          .sendRequest(
          method: HttpMethod.POST,
          url: CommerceApiUrls.category,
          body: data!.toJson(),
          cancelToken: CancelToken());
 if (result.data!.status == StatusModel.success) {
   var resultdata = result.data!.data! ["data"] as String;
   return CommerceResult<RemoteBaseModel, RemoteBaseModel<String>>(
       data: RemoteBaseModel(data: resultdata));
 }else {
    return CommerceResult<RemoteBaseModel, RemoteBaseModel<String>>(
        error: RemoteBaseModel(message: result.data!.message, status: result.data!.status));
 } } else {

      String key = CommerceHttpHeader().tokenKey;
      var result = await CommreceHttpClient(userToken: true).uploadMapResult(
          fileKey: imagfileld,
          file: file!,
          headers: {
            "Content-Type": "multipart/form-data",
            "Accept": "*/*",
            key:CommerceHttpHeader().usertoken
          },
          url: CommerceApiUrls.category,
          data: data!.toJson(),
          cancelToken: CancelToken());
      if (result.data!.status == StatusModel.success) {
        var resultdata = result.data!.data! ["data"] as String;
        return CommerceResult<RemoteBaseModel, RemoteBaseModel<String>>(
            data: RemoteBaseModel(data: resultdata));
      }else {
        return CommerceResult<RemoteBaseModel, RemoteBaseModel<String>>(
            error: RemoteBaseModel(message: result.data!.message, status: result.data!.status));
      }
    }
  }

  @override
  Future<CommerceResult<RemoteBaseModel, RemoteBaseModel >>
  deleteDataItem(String id) async {
    var result = await CommreceHttpClient(userToken: true). sendRequest(
        method: HttpMethod.DELETE,
        url: CommerceApiUrls.category + "/" + id,
        cancelToken: CancelToken());
    if (result.data!.status == StatusModel.success) {
      return CommerceResult<RemoteBaseModel, RemoteBaseModel>(
          data: RemoteBaseModel());
    }else {
      return CommerceResult<RemoteBaseModel, RemoteBaseModel>(
          error: RemoteBaseModel(message: result.data!.message, status: result.data!.status));

    }
  }

  @override
  Future<CommerceResult<RemoteBaseModel, RemoteBaseModel<List<BaseDataModel>>  >>
  getDataList() async {
      var result = await CommreceHttpClient(userToken: true).sendRequest(
          method: HttpMethod.GET,
          url: CommerceApiUrls .category,
          cancelToken: CancelToken());
      var resultdata = result.data!.data["data"]  as List<dynamic> ;
      List<BaseDataModel> listData = [];
      resultdata.map((e) => {
        listData.add(BaseDataModel.fromJson(e))
      }).toList();
      return  CommerceResult<RemoteBaseModel, RemoteBaseModel<List<BaseDataModel>>>    (data: RemoteBaseModel(data: listData));
  }
  @override
  Future<CommerceResult<RemoteBaseModel, RemoteBaseModel<BaseDataModel>>  > getSingleData(
      String id)async {
    var result = await CommreceHttpClient(userToken: true).sendRequest(
        method: HttpMethod.GET, url: "", cancelToken: CancelToken());
    if (result.data!.status == StatusModel.success) {
      var resultdata = result.data!.data! ["data"] as BaseDataModel;
      return CommerceResult<RemoteBaseModel, RemoteBaseModel<BaseDataModel>>(
          data: RemoteBaseModel(data: resultdata));
    }else {
      return CommerceResult<RemoteBaseModel, RemoteBaseModel<BaseDataModel>>(
          error: RemoteBaseModel(message: result.data!.message, status: result.data!.status));
    }
  }

  @override
  Future<CommerceResult<RemoteBaseModel, RemoteBaseModel>>
  updateDataItem(String id) {
    var result = CommreceHttpClient(userToken: true).sendRequest(
        method: HttpMethod.PUT,
        url: CommerceApiUrls.category + "/" + id,
        cancelToken: CancelToken());
    return result;
  }
}
