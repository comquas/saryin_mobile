import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkUtil {
  static NetworkUtil _instance = new NetworkUtil.internal();
  NetworkUtil.internal();
  factory NetworkUtil() => _instance;

  final JsonDecoder _decoder = new JsonDecoder();

  Future<dynamic> get(String url) {
    return http.get(url).then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw new Exception("Error while fetching data");
      }
      return _decoder.convert(res);
    });
  }

  Future<dynamic> graph(String url, String body, {String token = ""}) {
    var headers = {"Content-Type": "application/json"};
    if (token != "") {
      headers["Authorization"] = "Bearer $token";
    }
    body = body.replaceAll("\n", "\\n").replaceAll("\"", "\\\"");
    body = '{"query":"' + body + '"}';
    return http
        .post(url, body: body, headers: headers)
        .then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw new Exception("Error while fetching data");
      }
      var graphRes = _decoder.convert(res);
      if (graphRes.containsKey("data")) {
        return graphRes["data"];
      } else {
        throw new Exception("Something worng on response");
      }
    });
  }
}
