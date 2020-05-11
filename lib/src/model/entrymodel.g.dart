// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entrymodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Lamp _$LampFromJson(Map<String, dynamic> json) {
  return Lamp(
    json['locale'] as String,
    json['title'] as String,
    json['url'] as String,
    json['description'] as String,
    json['price'] as String,
    json['isfavorite'] as bool,
    json['categories'] as List,
    json['image'] as Map<String, dynamic>,
    json['tags'] as List,
    json['uid'] as String,
    json['created_by'] as String,
    json['updated_by'] as String,
    json['created_at'] as String,
    json['updated_at'] as String,
    json['_version'] as int,
  );
}

Map<String, dynamic> _$LampToJson(Lamp instance) => <String, dynamic>{
      'locale': instance.locale,
      'title': instance.title,
      'url': instance.url,
      'description': instance.description,
      'price': instance.price,
      'isfavorite': instance.isfavorite,
      'categories': instance.categories,
      'image': instance.image,
      'tags': instance.tags,
      'uid': instance.uid,
      'created_by': instance.createdBy,
      'updated_by': instance.updatedBy,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      '_version': instance.version,
    };
