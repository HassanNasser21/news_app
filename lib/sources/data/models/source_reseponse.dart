import 'source.dart';

class SourceReseponse {
  String? status;
  List<Source>? sources;

  SourceReseponse({this.status, this.sources});

  factory SourceReseponse.fromJson(Map<String, dynamic> json) {
    return SourceReseponse(
      status: json['status'] as String?,
      sources: (json['sources'] as List<dynamic>?)
          ?.map((e) => Source.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
