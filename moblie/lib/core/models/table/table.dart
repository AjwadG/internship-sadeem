import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import '/core/models/serializers.dart';
import '../base_model.dart';

part 'table.g.dart';

/// An example table model that should be serialized.
///   -  : means that its ok if the value is null
///   - @BuiltValueField: is the key that is in the JSON you
///     receive from an API
///

abstract class Table implements Built<Table, TableBuilder>, BaseModel<Table> {
  String? get id;

  bool? get is_available;

  bool? get is_needs_service;

  String? get name;

  String? get vendor_id;
  String? get customer_id;

  @override
  String toJson() {
    return json.encode(serializers.serializeWith(Table.serializer, this));
  }

  @override
  Map<String, dynamic>? toMap() {
    return serializers.serializeWith(Table.serializer, this)
        as Map<String, dynamic>?;
  }

  factory Table.fromJson(String jsonString) {
    return serializers.deserializeWith(
      Table.serializer,
      json.decode(jsonString),
    )!;
  }

  factory Table.fromMap(Map<String, dynamic> map) {
    return serializers.deserializeWith(
      Table.serializer,
      map,
    )!;
  }

  @override
  Table fromJson(String jsonString) => Table.fromJson(jsonString);

  @override
  Table fromMap(Map<String, dynamic> map) => Table.fromMap(map);

  Table._();

  static Serializer<Table> get serializer => _$tableSerializer;

  factory Table([void Function(TableBuilder)? updates]) = _$Table;
}
