// https://flutter.dev/docs/development/data-and-backend/json#serializing-json-inside-model-classes
import 'package:json_annotation/json_annotation.dart';
part 'entrymodel.g.dart';

@JsonSerializable(createFactory: true)
class Lamp {
  String locale;
  String title;
  String url;
  String description;
  String price;
  bool isfavorite;
  List categories;
  Map image;
  List tags;
  String uid;
  @JsonKey(name: 'created_by')
  String createdBy;
  @JsonKey(name: 'updated_by')
  String updatedBy;
  @JsonKey(name: 'created_at')
  String createdAt;
  @JsonKey(name: 'updated_at')
  String updatedAt;
  @JsonKey(name: '_version')
  int version;
  Lamp(
      this.locale,
      this.title,
      this.url,
      this.description,
      this.price,
      this.isfavorite,
      this.categories,
      this.image,
      this.tags,
      this.uid,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.version);
  factory Lamp.fromJson(Map<String, dynamic> json) =>
      _$LampFromJson(json);
  Map<String, dynamic> toJson() => _$LampToJson(this);
}
