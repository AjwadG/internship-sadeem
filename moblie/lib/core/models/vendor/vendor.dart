import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import '/core/models/serializers.dart';
import '../base_model.dart';

part 'vendor.g.dart';

/// An example vendor model that should be serialized.
///   -  : means that its ok if the value is null
///   - @BuiltValueField: is the key that is in the JSON you
///     receive from an API
///

abstract class Vendor
    implements Built<Vendor, VendorBuilder>, BaseModel<Vendor> {
  String? get id;

  String? get description;

  String? get img;

  String? get name;

  DateTime? get created_at;

  DateTime? get updated_at;

  @override
  String toJson() {
    return json.encode(serializers.serializeWith(Vendor.serializer, this));
  }

  @override
  Map<String, dynamic>? toMap() {
    return serializers.serializeWith(Vendor.serializer, this)
        as Map<String, dynamic>?;
  }

  factory Vendor.fromJson(String jsonString) {
    return serializers.deserializeWith(
      Vendor.serializer,
      json.decode(jsonString),
    )!;
  }

  factory Vendor.fromMap(Map<String, dynamic> map) {
    return serializers.deserializeWith(
      Vendor.serializer,
      map,
    )!;
  }

  @override
  Vendor fromJson(String jsonString) => Vendor.fromJson(jsonString);

  @override
  Vendor fromMap(Map<String, dynamic> map) => Vendor.fromMap(map);

  Vendor._();

  static Serializer<Vendor> get serializer => _$vendorSerializer;

  factory Vendor([void Function(VendorBuilder)? updates]) = _$Vendor;
}
