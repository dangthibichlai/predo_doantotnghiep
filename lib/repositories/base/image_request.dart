import 'dart:convert';
import 'package:test_intern/resources/export/core_export.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ImageRequest {
  List<String>? files;
  ImageRequest({
    this.files,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      if (!AppValidate.nullOrEmpty(files)) 'files': files,
    };
  }

  factory ImageRequest.fromMap(Map<String, dynamic> map) {
    return ImageRequest(
      files: map['files'] != null ? List<String>.from(map['files'] as List<String>) : [],
    );
  }

  String toJson() => json.encode(toMap());

  factory ImageRequest.fromJson(String source) => ImageRequest.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ImageRequest(files: $files)';
}
