import 'dart:convert';
import 'package:api_calling/modal.dart';
import 'package:http/http.dart' as http;

class ApiHelper
{
  static ApiHelper apiHelper = ApiHelper._();
  ApiHelper._();

  Future<TryData> getApi()
  async {
    String link = "https://praticle-service.s3.ap-south-1.amazonaws.com/api.json";
    Uri uri = Uri.parse(link);
    var res = await http.get(uri);
    var json = jsonDecode(res.body);
    TryData data = TryData.fromJson(json);
    return data;
  }
}
