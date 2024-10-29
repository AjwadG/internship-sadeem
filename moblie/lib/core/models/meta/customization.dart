import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '/core/models/serializers.dart';

part 'customization.g.dart';

/// An example post model that should be serialized.
///   -  : means that its ok if the value is null
///   - @BuiltValueField: is the key that is in the JSON you
///     receive from an API
///

abstract class Customization
    implements Built<Customization, CustomizationBuilder> {
  String? get app_name;

  String? get app_color_primary;

  String? get app_color_secondary;

  String? get app_color_on_secondary;

  String? get app_color_on_primary;

  String? get app_color_accent;

  String? get app_color_invoice_header_text;

  String toJson() {
    return json
        .encode(serializers.serializeWith(Customization.serializer, this));
  }

  Map<String, dynamic>? toMap() {
    return serializers.serializeWith(Customization.serializer, this)
        as Map<String, dynamic>?;
  }

  factory Customization.fromJson(String jsonString) {
    return serializers.deserializeWith(
      Customization.serializer,
      json.decode(jsonString),
    )!;
  }

  factory Customization.fromMap(Map<String, dynamic> map) {
    return serializers.deserializeWith(
      Customization.serializer,
      map,
    )!;
  }

  Customization._();

  factory Customization([void Function(CustomizationBuilder)? updates]) =
      _$Customization;

  static Serializer<Customization> get serializer => _$customizationSerializer;
}
