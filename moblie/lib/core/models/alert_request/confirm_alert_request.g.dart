// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'confirm_alert_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ConfirmAlertRequest extends ConfirmAlertRequest {
  @override
  final String title;
  @override
  final bool? dismissible;
  @override
  final String description;
  @override
  final String buttonConfirmTitle;
  @override
  final String buttonCancelTitle;

  factory _$ConfirmAlertRequest(
          [void Function(ConfirmAlertRequestBuilder)? updates]) =>
      (new ConfirmAlertRequestBuilder()..update(updates))._build();

  _$ConfirmAlertRequest._(
      {required this.title,
      this.dismissible,
      required this.description,
      required this.buttonConfirmTitle,
      required this.buttonCancelTitle})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        title, r'ConfirmAlertRequest', 'title');
    BuiltValueNullFieldError.checkNotNull(
        description, r'ConfirmAlertRequest', 'description');
    BuiltValueNullFieldError.checkNotNull(
        buttonConfirmTitle, r'ConfirmAlertRequest', 'buttonConfirmTitle');
    BuiltValueNullFieldError.checkNotNull(
        buttonCancelTitle, r'ConfirmAlertRequest', 'buttonCancelTitle');
  }

  @override
  ConfirmAlertRequest rebuild(
          void Function(ConfirmAlertRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ConfirmAlertRequestBuilder toBuilder() =>
      new ConfirmAlertRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ConfirmAlertRequest &&
        title == other.title &&
        dismissible == other.dismissible &&
        description == other.description &&
        buttonConfirmTitle == other.buttonConfirmTitle &&
        buttonCancelTitle == other.buttonCancelTitle;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, dismissible.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, buttonConfirmTitle.hashCode);
    _$hash = $jc(_$hash, buttonCancelTitle.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ConfirmAlertRequest')
          ..add('title', title)
          ..add('dismissible', dismissible)
          ..add('description', description)
          ..add('buttonConfirmTitle', buttonConfirmTitle)
          ..add('buttonCancelTitle', buttonCancelTitle))
        .toString();
  }
}

class ConfirmAlertRequestBuilder
    implements Builder<ConfirmAlertRequest, ConfirmAlertRequestBuilder> {
  _$ConfirmAlertRequest? _$v;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  bool? _dismissible;
  bool? get dismissible => _$this._dismissible;
  set dismissible(bool? dismissible) => _$this._dismissible = dismissible;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _buttonConfirmTitle;
  String? get buttonConfirmTitle => _$this._buttonConfirmTitle;
  set buttonConfirmTitle(String? buttonConfirmTitle) =>
      _$this._buttonConfirmTitle = buttonConfirmTitle;

  String? _buttonCancelTitle;
  String? get buttonCancelTitle => _$this._buttonCancelTitle;
  set buttonCancelTitle(String? buttonCancelTitle) =>
      _$this._buttonCancelTitle = buttonCancelTitle;

  ConfirmAlertRequestBuilder();

  ConfirmAlertRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _title = $v.title;
      _dismissible = $v.dismissible;
      _description = $v.description;
      _buttonConfirmTitle = $v.buttonConfirmTitle;
      _buttonCancelTitle = $v.buttonCancelTitle;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ConfirmAlertRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ConfirmAlertRequest;
  }

  @override
  void update(void Function(ConfirmAlertRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ConfirmAlertRequest build() => _build();

  _$ConfirmAlertRequest _build() {
    final _$result = _$v ??
        new _$ConfirmAlertRequest._(
            title: BuiltValueNullFieldError.checkNotNull(
                title, r'ConfirmAlertRequest', 'title'),
            dismissible: dismissible,
            description: BuiltValueNullFieldError.checkNotNull(
                description, r'ConfirmAlertRequest', 'description'),
            buttonConfirmTitle: BuiltValueNullFieldError.checkNotNull(
                buttonConfirmTitle,
                r'ConfirmAlertRequest',
                'buttonConfirmTitle'),
            buttonCancelTitle: BuiltValueNullFieldError.checkNotNull(
                buttonCancelTitle,
                r'ConfirmAlertRequest',
                'buttonCancelTitle'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
