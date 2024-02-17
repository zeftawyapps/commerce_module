// create class UsersHttpUrls use singleton pattern
import 'package:commerce_module/https/i_http_urls.dart';



class CommerceBaseUrlEnveiroment {
  String? baseUrl = "https://eventapp-api.herokuapp.com/api/v1";
  var _response;
  var _endPoints;
  static final CommerceBaseUrlEnveiroment _baseUrlEnvet =
  CommerceBaseUrlEnveiroment._internal();

  factory CommerceBaseUrlEnveiroment({String? baseUrl}) {
    if (baseUrl != null) _baseUrlEnvet.baseUrl = baseUrl;
    if (_baseUrlEnvet._endPoints == null) {
      _baseUrlEnvet._endPoints = (
      testConnection: "${_baseUrlEnvet.baseUrl}/testConnection",

      category: "${_baseUrlEnvet.baseUrl}/category",
      data: "data",
      error: "error",
      message: "message",
      status: "status,"
      );
    }
    return _baseUrlEnvet;
  }

  CommerceBaseUrlEnveiroment._internal();

  factory CommerceBaseUrlEnveiroment.urls({
    String? baseUrl,
    String? testConnection,
    String ? category ,

  }) {
    _baseUrlEnvet.baseUrl = baseUrl;
    _baseUrlEnvet._endPoints = (
    testConnection:
    "${_baseUrlEnvet.baseUrl}${testConnection ?? "/testConnection"}",


    category:
    "${_baseUrlEnvet.baseUrl}${category ?? "/category"}",




    data: "data",
    error: "error",
    message: "message",
    status: "status,"
    );

    return _baseUrlEnvet;
  }

  get endPoints => _endPoints!;
  get response => _response!;
}

// create class UsersHttpheader use singleton pattern
class CommerceHttpHeader {
  String _usertoken = '';
  String _contentType = '';
  String _contentTypeKey = '';
  String _tokenKey = '';
  String _tokenType = '';
  // create instance UsersHttpheader
  static final CommerceHttpHeader _instance = CommerceHttpHeader._internal();

  factory CommerceHttpHeader() => _instance;
  void setAuthHeader(String token ,  {String  Bearer = "Bearer"  , String  tokenType = ""
    , String tokenKey ="Authorization" ,
  }) {
    _usertoken =  Bearer +  token;
    _tokenKey = tokenKey;
    _tokenType = tokenType;
    // _contentType = contentType ;
    // _contentTypeKey = contentTypeKey ;

  }


  // getter
  String get tokenKey => _tokenKey;
  String get tokenType => _tokenType;
  String get contentTypeKey => _contentTypeKey;
  String get contentType => _contentType;

  String get usertoken => _usertoken;
  // create UsersHttpheader._internal
  CommerceHttpHeader._internal();



}
