import 'dart:convert';

import 'package:news_app/api/api_constants.dart';
import 'package:news_app/models/source_reseponse/source_reseponse.dart';
import 'package:http/http.dart' as http;

class SourcesDataSource {

     Future<SourceReseponse> getSources(String categoryId) async {
    Uri uri = Uri.https(ApiConstants.baseurl, ApiConstants.sourceEndpoint, {
      'apiKey': ApiConstants.apikey,
      'category': categoryId,
    });
    http.Response response = await http.get(uri);
    Map<String, dynamic> json = jsonDecode(response.body);
    return SourceReseponse.fromJson(json);
  }
}