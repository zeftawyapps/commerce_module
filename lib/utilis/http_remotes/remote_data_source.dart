 import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';

import '../../https/commerce_http_urls.dart';
import '../errors/http_errors/bass_errors.dart';
import '../errors/http_errors/errors/unknown_error.dart';
import '../models/base_model.dart';
import 'http_client.dart';
import 'http_methos_enum.dart';


class RemoteDataSource {

  /// [TModel] type of model response from server
  /// [TResponse]type of response from dart should be  dynamic map or List<dynamic>
  Future<Either<RemoteBaseModel, TModel>> request<TModel, TResponse>(
      {required TResponse Function(dynamic) converter,
        required HttpMethod method,
        required String url,
        Map<String, dynamic>? queryParameters,
        Map<String, dynamic>? body,
        bool withAuthentication = false,
        required CancelToken cancelToken,
        String? baseUrl,
        bool? userToken}) async {

    /// show progress dialog every request

    // Send the request.
    Either<RemoteBaseModel, dynamic> response = await HttpClient(
        baseUrl: baseUrl ?? CommerceHttpUrls().BaseUrl, userToken: userToken ?? false)
        .sendRequest<dynamic>(
      method: method,
      url: url,
      queryParameters: queryParameters ?? {},
      body: body,
      cancelToken: cancelToken,
    );
    // convert jsonResponse to model and return it
    var responseModel;
    if (response.isLeft()) {
      return Left((response as Left<RemoteBaseModel, TResponse>).value);
    } else if (response.isRight()) {
      try {
        responseModel =
            converter((response as Right<RemoteBaseModel, TResponse>).value);
        return Right(responseModel);
      } catch (e) {
        print(e);
        return Left(RemoteBaseModel());
      }
    }
    return Left(RemoteBaseModel());
  }

 }
