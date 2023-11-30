class BaseApi {
  static String api = "http://192.168.0.105:8000";
}

class Auth extends BaseApi {
  static var login = '${BaseApi.api}/api/login';
  static var logout = '${BaseApi.api}/api/v1/logout';
}

class SubApi extends BaseApi {
  static var orders = '${BaseApi.api}/api/orders';
  static var labaratory = '${BaseApi.api}/api/labaratory';
  static var orderShow = '${BaseApi.api}/api/samplePart/';
}
