import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:newsapp/model/source_response.dart';
import 'package:newsapp/utils/api_constant.dart';
import 'package:newsapp/utils/end_points.dart';

class ApiManager {
  ///https://newsapi.org/v2/top-headlines/sources?apiKey=84c34fd58ebe4efb98b64134a005e514
  ///
  ///
  static Future<SourceResponce?> getSources() async {
    Uri url = Uri.https(ApiConstant.baseUrl, EndPoints.sourceApi,
        {'apiKey': ApiConstant.apiKey});
    try {
      var response = await http.get(url);
      return SourceResponce.fromJson(jsonDecode(response.body));
    } catch (e) {
      // ignore: use_rethrow_when_possible
      throw e;
    }
  }
}
