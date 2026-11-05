import 'package:dio/dio.dart';
import 'package:news_app/core/resources/app_constants.dart';
import 'package:news_app/models/sources/source.dart';

class SourceResponse {
  SourceResponse({this.status, this.sources});

  SourceResponse.fromJson(dynamic json) {
    status = json['status'];
    if (json['sources'] != null) {
      sources = [];
      json['sources'].forEach((v) {
        sources?.add(Source.fromJson(v));
      });
    }
    message = json['message'];
    code = json['code'];
  }

  String? status;
  String? code;
  String? message;
  List<Source>? sources;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    map['code'] = code;
    
    if (sources != null) {
      map['sources'] = sources?.map((v) => v.toJson()).toList();
    }
    return map;
  }

 
}
