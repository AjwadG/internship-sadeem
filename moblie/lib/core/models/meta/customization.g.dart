// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customization.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Customization> _$customizationSerializer =
    new _$CustomizationSerializer();

class _$CustomizationSerializer implements StructuredSerializer<Customization> {
  @override
  final Iterable<Type> types = const [Customization, _$Customization];
  @override
  final String wireName = 'Customization';

  @override
  Iterable<Object?> serialize(Serializers serializers, Customization object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.app_name;
    if (value != null) {
      result
        ..add('app_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.app_color_primary;
    if (value != null) {
      result
        ..add('app_color_primary')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.app_color_secondary;
    if (value != null) {
      result
        ..add('app_color_secondary')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.app_color_on_secondary;
    if (value != null) {
      result
        ..add('app_color_on_secondary')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.app_color_on_primary;
    if (value != null) {
      result
        ..add('app_color_on_primary')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.app_color_accent;
    if (value != null) {
      result
        ..add('app_color_accent')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.app_color_invoice_header_text;
    if (value != null) {
      result
        ..add('app_color_invoice_header_text')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Customization deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CustomizationBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'app_name':
          result.app_name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'app_color_primary':
          result.app_color_primary = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'app_color_secondary':
          result.app_color_secondary = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'app_color_on_secondary':
          result.app_color_on_secondary = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'app_color_on_primary':
          result.app_color_on_primary = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'app_color_accent':
          result.app_color_accent = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'app_color_invoice_header_text':
          result.app_color_invoice_header_text = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$Customization extends Customization {
  @override
  final String? app_name;
  @override
  final String? app_color_primary;
  @override
  final String? app_color_secondary;
  @override
  final String? app_color_on_secondary;
  @override
  final String? app_color_on_primary;
  @override
  final String? app_color_accent;
  @override
  final String? app_color_invoice_header_text;

  factory _$Customization([void Function(CustomizationBuilder)? updates]) =>
      (new CustomizationBuilder()..update(updates))._build();

  _$Customization._(
      {this.app_name,
      this.app_color_primary,
      this.app_color_secondary,
      this.app_color_on_secondary,
      this.app_color_on_primary,
      this.app_color_accent,
      this.app_color_invoice_header_text})
      : super._();

  @override
  Customization rebuild(void Function(CustomizationBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CustomizationBuilder toBuilder() => new CustomizationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Customization &&
        app_name == other.app_name &&
        app_color_primary == other.app_color_primary &&
        app_color_secondary == other.app_color_secondary &&
        app_color_on_secondary == other.app_color_on_secondary &&
        app_color_on_primary == other.app_color_on_primary &&
        app_color_accent == other.app_color_accent &&
        app_color_invoice_header_text == other.app_color_invoice_header_text;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, app_name.hashCode);
    _$hash = $jc(_$hash, app_color_primary.hashCode);
    _$hash = $jc(_$hash, app_color_secondary.hashCode);
    _$hash = $jc(_$hash, app_color_on_secondary.hashCode);
    _$hash = $jc(_$hash, app_color_on_primary.hashCode);
    _$hash = $jc(_$hash, app_color_accent.hashCode);
    _$hash = $jc(_$hash, app_color_invoice_header_text.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Customization')
          ..add('app_name', app_name)
          ..add('app_color_primary', app_color_primary)
          ..add('app_color_secondary', app_color_secondary)
          ..add('app_color_on_secondary', app_color_on_secondary)
          ..add('app_color_on_primary', app_color_on_primary)
          ..add('app_color_accent', app_color_accent)
          ..add('app_color_invoice_header_text', app_color_invoice_header_text))
        .toString();
  }
}

class CustomizationBuilder
    implements Builder<Customization, CustomizationBuilder> {
  _$Customization? _$v;

  String? _app_name;
  String? get app_name => _$this._app_name;
  set app_name(String? app_name) => _$this._app_name = app_name;

  String? _app_color_primary;
  String? get app_color_primary => _$this._app_color_primary;
  set app_color_primary(String? app_color_primary) =>
      _$this._app_color_primary = app_color_primary;

  String? _app_color_secondary;
  String? get app_color_secondary => _$this._app_color_secondary;
  set app_color_secondary(String? app_color_secondary) =>
      _$this._app_color_secondary = app_color_secondary;

  String? _app_color_on_secondary;
  String? get app_color_on_secondary => _$this._app_color_on_secondary;
  set app_color_on_secondary(String? app_color_on_secondary) =>
      _$this._app_color_on_secondary = app_color_on_secondary;

  String? _app_color_on_primary;
  String? get app_color_on_primary => _$this._app_color_on_primary;
  set app_color_on_primary(String? app_color_on_primary) =>
      _$this._app_color_on_primary = app_color_on_primary;

  String? _app_color_accent;
  String? get app_color_accent => _$this._app_color_accent;
  set app_color_accent(String? app_color_accent) =>
      _$this._app_color_accent = app_color_accent;

  String? _app_color_invoice_header_text;
  String? get app_color_invoice_header_text =>
      _$this._app_color_invoice_header_text;
  set app_color_invoice_header_text(String? app_color_invoice_header_text) =>
      _$this._app_color_invoice_header_text = app_color_invoice_header_text;

  CustomizationBuilder();

  CustomizationBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _app_name = $v.app_name;
      _app_color_primary = $v.app_color_primary;
      _app_color_secondary = $v.app_color_secondary;
      _app_color_on_secondary = $v.app_color_on_secondary;
      _app_color_on_primary = $v.app_color_on_primary;
      _app_color_accent = $v.app_color_accent;
      _app_color_invoice_header_text = $v.app_color_invoice_header_text;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Customization other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Customization;
  }

  @override
  void update(void Function(CustomizationBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Customization build() => _build();

  _$Customization _build() {
    final _$result = _$v ??
        new _$Customization._(
            app_name: app_name,
            app_color_primary: app_color_primary,
            app_color_secondary: app_color_secondary,
            app_color_on_secondary: app_color_on_secondary,
            app_color_on_primary: app_color_on_primary,
            app_color_accent: app_color_accent,
            app_color_invoice_header_text: app_color_invoice_header_text);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
