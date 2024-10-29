library serializers;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:internship/core/models/item/item.dart';
import 'package:internship/core/models/meta/customization.dart';
import 'package:internship/core/models/meta/meta.dart';
import 'package:internship/core/models/meta/settings.dart';
import 'package:internship/core/models/parent/parent.dart';
import 'package:internship/core/models/table/table.dart';
import 'package:internship/core/models/vendor/vendor.dart';
import '/core/models/user/user.dart';

part 'serializers.g.dart';

/// List of models that will have a serializer generated for them.
///   - Usually you only add models here that you expect to fetch from some API

@SerializersFor([
  User,
  Customization,
  Settings,
  Error,
  Meta,
  Parent,
  Vendor,
  Table,
  Item
])

/// Can add additional plugins that will serialize types like [DateTime]
///   - It is also possible to write your own Serializer plugins for type that
///     are not supported by default.
///   - For Example: https://github.com/google/built_value.dart/issues/543
///     implements [SerializerPlugin] and writes a serializer for Firebase
///     Datetime that converts TimeStamp or DateTime to integers.
Serializers serializers = (_$serializers.toBuilder()
      ..addPlugin(StandardJsonPlugin())
      ..add(Iso8601DateTimeSerializer()))
    .build();
