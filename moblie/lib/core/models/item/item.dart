import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import '/core/models/serializers.dart';
import '../base_model.dart';

part 'item.g.dart';

/// An example item model that should be serialized.
///   -  : means that its ok if the value is null
///   - @BuiltValueField: is the key that is in the JSON you
///     receive from an API
///

abstract class Item implements Built<Item, ItemBuilder>, BaseModel<Item> {
  String? get id;

  double? get price;

  String? get img;

  String? get name;

  DateTime? get created_at;

  DateTime? get updated_at;

  @override
  String toJson() {
    return json.encode(serializers.serializeWith(Item.serializer, this));
  }

  @override
  Map<String, dynamic>? toMap() {
    return serializers.serializeWith(Item.serializer, this)
        as Map<String, dynamic>?;
  }

  factory Item.fromJson(String jsonString) {
    return serializers.deserializeWith(
      Item.serializer,
      json.decode(jsonString),
    )!;
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return serializers.deserializeWith(
      Item.serializer,
      map,
    )!;
  }

  @override
  Item fromJson(String jsonString) => Item.fromJson(jsonString);

  @override
  Item fromMap(Map<String, dynamic> map) => Item.fromMap(map);

  Item._();

  static Serializer<Item> get serializer => _$itemSerializer;

  factory Item([void Function(ItemBuilder)? updates]) = _$Item;
}
