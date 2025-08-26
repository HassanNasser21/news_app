import 'dart:async';
import 'dart:convert';

import 'package:news_app/api/api_constants.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/sources/data/data_source/sources_data_source.dart';
import 'package:news_app/sources/data/models/source.dart';
import 'package:news_app/sources/data/models/source_reseponse.dart';

class SourcesApiDataSource implements SourcesDataSource{
  @override
  Future<List<Source>> getSources(String categoryId) async {
    Uri uri = Uri.https(ApiConstants.baseurl, ApiConstants.sourceEndpoint, {
      'apiKey': ApiConstants.apikey,
      'category': categoryId,
    });
    http.Response response = await http.get(uri);
    Map<String, dynamic> json = jsonDecode(response.body);
    SourceReseponse sourceReseponse = SourceReseponse.fromJson(json);
    if (sourceReseponse.status == 'ok' && sourceReseponse.sources != null) {
      return sourceReseponse.sources! as List<Source>;
    } else {
      throw Exception('Error fetching sources');
    }
  }
}
