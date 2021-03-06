import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'entry.dart';
import 'system_fields.dart';

part 'asset.g.dart';

@JsonSerializable()
class Asset extends Entry<AssetFields> {
  Asset({
    SystemFields sys,
    AssetFields fields,
  }) : super(sys: sys, fields: fields);

  factory Asset.fromJson(Map<String, dynamic> json) => _$AssetFromJson(json);
  Map<String, dynamic> toJson() => _$AssetToJson(this);
}

@JsonSerializable()
class AssetFields extends Equatable {
  AssetFields({this.title, this.file, this.description});

  final String title;
  final String description;
  final AssetFile file;

  @override
  List<Object> get props => [title, file];

  factory AssetFields.fromJson(Map<String, dynamic> json) =>
      _$AssetFieldsFromJson(json);

  Map<String, dynamic> toJson() => _$AssetFieldsToJson(this);
}

@JsonSerializable()
class AssetFile extends Equatable {
  AssetFile({
    this.fileName,
    this.contentType,
    this.url,
    this.details,
  });

  final String fileName;
  final String contentType;
  final String url;
  final AssetFileDetails details;

  String get httpsUrl => 'https:${this.url}';
  String httpsUrlWithSize({int height, int width}) {
    String url = httpsUrl;
    url += '?';
    if (height != null) {
      url += 'h=$height';
    }
    if (width != null) {
      url += 'w=$width';
    }
    return url;
  }

  @override
  List<Object> get props => [fileName, contentType, url, details];

  factory AssetFile.fromJson(Map<String, dynamic> json) =>
      _$AssetFileFromJson(json);

  Map<String, dynamic> toJson() => _$AssetFileToJson(this);
}

@JsonSerializable()
class AssetFileDetails extends Equatable {
  AssetFileDetails({
    this.size,
    this.image,
  });

  final int size;
  final AssetFileDetailsImage image;

  @override
  List<Object> get props => [size, image];

  factory AssetFileDetails.fromJson(Map<String, dynamic> json) =>
      _$AssetFileDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$AssetFileDetailsToJson(this);
}

@JsonSerializable()
class AssetFileDetailsImage extends Equatable {
  AssetFileDetailsImage({
    this.height,
    this.width,
  });

  final int height;
  final int width;

  @override
  List<Object> get props => [height, width];

  factory AssetFileDetailsImage.fromJson(Map<String, dynamic> json) =>
      _$AssetFileDetailsImageFromJson(json);

  Map<String, dynamic> toJson() => _$AssetFileDetailsImageToJson(this);
}
