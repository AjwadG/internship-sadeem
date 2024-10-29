// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meta.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Meta> _$metaSerializer = new _$MetaSerializer();

class _$MetaSerializer implements StructuredSerializer<Meta> {
  @override
  final Iterable<Type> types = const [Meta, _$Meta];
  @override
  final String wireName = 'Meta';

  @override
  Iterable<Object?> serialize(Serializers serializers, Meta object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.domain;
    if (value != null) {
      result
        ..add('domain')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.page_size;
    if (value != null) {
      result
        ..add('page_size')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.items_category_id;
    if (value != null) {
      result
        ..add('items_category_id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.vendors_category_id;
    if (value != null) {
      result
        ..add('vendors_category_id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.api_version;
    if (value != null) {
      result
        ..add('api_version')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.project_name;
    if (value != null) {
      result
        ..add('project_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.customization;
    if (value != null) {
      result
        ..add('customization')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(Customization)));
    }
    value = object.super_parents;
    if (value != null) {
      result
        ..add('super_parents')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(Parent)));
    }
    value = object.settings;
    if (value != null) {
      result
        ..add('settings')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(Settings)));
    }
    return result;
  }

  @override
  Meta deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MetaBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'domain':
          result.domain = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'page_size':
          result.page_size = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'items_category_id':
          result.items_category_id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'vendors_category_id':
          result.vendors_category_id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'api_version':
          result.api_version = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'project_name':
          result.project_name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'customization':
          result.customization.replace(serializers.deserialize(value,
              specifiedType: const FullType(Customization))! as Customization);
          break;
        case 'super_parents':
          result.super_parents.replace(serializers.deserialize(value,
              specifiedType: const FullType(Parent))! as Parent);
          break;
        case 'settings':
          result.settings.replace(serializers.deserialize(value,
              specifiedType: const FullType(Settings))! as Settings);
          break;
      }
    }

    return result.build();
  }
}

class _$Meta extends Meta {
  @override
  final int? id;
  @override
  final String? domain;
  @override
  final int? page_size;
  @override
  final String? items_category_id;
  @override
  final String? vendors_category_id;
  @override
  final String? api_version;
  @override
  final String? project_name;
  @override
  final Customization? customization;
  @override
  final Parent? super_parents;
  @override
  final Settings? settings;

  factory _$Meta([void Function(MetaBuilder)? updates]) =>
      (new MetaBuilder()..update(updates))._build();

  _$Meta._(
      {this.id,
      this.domain,
      this.page_size,
      this.items_category_id,
      this.vendors_category_id,
      this.api_version,
      this.project_name,
      this.customization,
      this.super_parents,
      this.settings})
      : super._();

  @override
  Meta rebuild(void Function(MetaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MetaBuilder toBuilder() => new MetaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Meta &&
        id == other.id &&
        domain == other.domain &&
        page_size == other.page_size &&
        items_category_id == other.items_category_id &&
        vendors_category_id == other.vendors_category_id &&
        api_version == other.api_version &&
        project_name == other.project_name &&
        customization == other.customization &&
        super_parents == other.super_parents &&
        settings == other.settings;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, domain.hashCode);
    _$hash = $jc(_$hash, page_size.hashCode);
    _$hash = $jc(_$hash, items_category_id.hashCode);
    _$hash = $jc(_$hash, vendors_category_id.hashCode);
    _$hash = $jc(_$hash, api_version.hashCode);
    _$hash = $jc(_$hash, project_name.hashCode);
    _$hash = $jc(_$hash, customization.hashCode);
    _$hash = $jc(_$hash, super_parents.hashCode);
    _$hash = $jc(_$hash, settings.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Meta')
          ..add('id', id)
          ..add('domain', domain)
          ..add('page_size', page_size)
          ..add('items_category_id', items_category_id)
          ..add('vendors_category_id', vendors_category_id)
          ..add('api_version', api_version)
          ..add('project_name', project_name)
          ..add('customization', customization)
          ..add('super_parents', super_parents)
          ..add('settings', settings))
        .toString();
  }
}

class MetaBuilder implements Builder<Meta, MetaBuilder> {
  _$Meta? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _domain;
  String? get domain => _$this._domain;
  set domain(String? domain) => _$this._domain = domain;

  int? _page_size;
  int? get page_size => _$this._page_size;
  set page_size(int? page_size) => _$this._page_size = page_size;

  String? _items_category_id;
  String? get items_category_id => _$this._items_category_id;
  set items_category_id(String? items_category_id) =>
      _$this._items_category_id = items_category_id;

  String? _vendors_category_id;
  String? get vendors_category_id => _$this._vendors_category_id;
  set vendors_category_id(String? vendors_category_id) =>
      _$this._vendors_category_id = vendors_category_id;

  String? _api_version;
  String? get api_version => _$this._api_version;
  set api_version(String? api_version) => _$this._api_version = api_version;

  String? _project_name;
  String? get project_name => _$this._project_name;
  set project_name(String? project_name) => _$this._project_name = project_name;

  CustomizationBuilder? _customization;
  CustomizationBuilder get customization =>
      _$this._customization ??= new CustomizationBuilder();
  set customization(CustomizationBuilder? customization) =>
      _$this._customization = customization;

  ParentBuilder? _super_parents;
  ParentBuilder get super_parents =>
      _$this._super_parents ??= new ParentBuilder();
  set super_parents(ParentBuilder? super_parents) =>
      _$this._super_parents = super_parents;

  SettingsBuilder? _settings;
  SettingsBuilder get settings => _$this._settings ??= new SettingsBuilder();
  set settings(SettingsBuilder? settings) => _$this._settings = settings;

  MetaBuilder();

  MetaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _domain = $v.domain;
      _page_size = $v.page_size;
      _items_category_id = $v.items_category_id;
      _vendors_category_id = $v.vendors_category_id;
      _api_version = $v.api_version;
      _project_name = $v.project_name;
      _customization = $v.customization?.toBuilder();
      _super_parents = $v.super_parents?.toBuilder();
      _settings = $v.settings?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Meta other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Meta;
  }

  @override
  void update(void Function(MetaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Meta build() => _build();

  _$Meta _build() {
    _$Meta _$result;
    try {
      _$result = _$v ??
          new _$Meta._(
              id: id,
              domain: domain,
              page_size: page_size,
              items_category_id: items_category_id,
              vendors_category_id: vendors_category_id,
              api_version: api_version,
              project_name: project_name,
              customization: _customization?.build(),
              super_parents: _super_parents?.build(),
              settings: _settings?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'customization';
        _customization?.build();
        _$failedField = 'super_parents';
        _super_parents?.build();
        _$failedField = 'settings';
        _settings?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'Meta', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
