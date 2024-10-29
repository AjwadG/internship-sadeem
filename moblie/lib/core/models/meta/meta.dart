import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:internship/core/models/meta/customization.dart';
import 'package:internship/core/models/meta/settings.dart';

import '../parent/parent.dart';
import '/core/models/serializers.dart';
import '../base_model.dart';

part 'meta.g.dart';

/// An example post model that should be serialized.
///   -  : means that its ok if the value is null
///   - @BuiltValueField: is the key that is in the JSON you
///     receive from an API
///

abstract class Meta implements Built<Meta, MetaBuilder>, BaseModel<Meta> {
  int? get id;

  String? get domain;

  int? get page_size;

  String? get items_category_id;

  String? get vendors_category_id;

  String? get api_version;

  String? get project_name;

  Customization? get customization;
  Parent ? get super_parents;

  Settings? get settings;

  @override
  String toJson() {
    return json.encode(serializers.serializeWith(Meta.serializer, this));
  }

  @override
  Map<String, dynamic>? toMap() {
    return serializers.serializeWith(Meta.serializer, this)
        as Map<String, dynamic>?;
  }

  factory Meta.fromJson(String jsonString) {
    return serializers.deserializeWith(
      Meta.serializer,
      json.decode(jsonString),
    )!;
  }

  factory Meta.fromMap(Map<String, dynamic> map) {
    return serializers.deserializeWith(
      Meta.serializer,
      map,
    )!;
  }

  @override
  Meta fromJson(String jsonString) => Meta.fromJson(jsonString);

  @override
  Meta fromMap(Map<String, dynamic> map) => Meta.fromMap(map);

  Meta._();

  factory Meta([void Function(MetaBuilder)? updates]) = _$Meta;

  static Serializer<Meta> get serializer => _$metaSerializer;
}
