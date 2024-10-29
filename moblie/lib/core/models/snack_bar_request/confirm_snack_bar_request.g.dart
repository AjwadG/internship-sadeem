// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'confirm_snack_bar_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ConfirmSnackBarRequest extends ConfirmSnackBarRequest {
  @override
  final String? message;
  @override
  final String? buttonText;
  @override
  final void Function()? onPressed;

  factory _$ConfirmSnackBarRequest(
          [void Function(ConfirmSnackBarRequestBuilder)? updates]) =>
      (new ConfirmSnackBarRequestBuilder()..update(updates))._build();

  _$ConfirmSnackBarRequest._({this.message, this.buttonText, this.onPressed})
      : super._();

  @override
  ConfirmSnackBarRequest rebuild(
          void Function(ConfirmSnackBarRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ConfirmSnackBarRequestBuilder toBuilder() =>
      new ConfirmSnackBarRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    final dynamic _$dynamicOther = other;
    return other is ConfirmSnackBarRequest &&
        message == other.message &&
        buttonText == other.buttonText &&
        onPressed == _$dynamicOther.onPressed;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jc(_$hash, buttonText.hashCode);
    _$hash = $jc(_$hash, onPressed.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ConfirmSnackBarRequest')
          ..add('message', message)
          ..add('buttonText', buttonText)
          ..add('onPressed', onPressed))
        .toString();
  }
}

class ConfirmSnackBarRequestBuilder
    implements Builder<ConfirmSnackBarRequest, ConfirmSnackBarRequestBuilder> {
  _$ConfirmSnackBarRequest? _$v;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  String? _buttonText;
  String? get buttonText => _$this._buttonText;
  set buttonText(String? buttonText) => _$this._buttonText = buttonText;

  void Function()? _onPressed;
  void Function()? get onPressed => _$this._onPressed;
  set onPressed(void Function()? onPressed) => _$this._onPressed = onPressed;

  ConfirmSnackBarRequestBuilder();

  ConfirmSnackBarRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _message = $v.message;
      _buttonText = $v.buttonText;
      _onPressed = $v.onPressed;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ConfirmSnackBarRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ConfirmSnackBarRequest;
  }

  @override
  void update(void Function(ConfirmSnackBarRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ConfirmSnackBarRequest build() => _build();

  _$ConfirmSnackBarRequest _build() {
    final _$result = _$v ??
        new _$ConfirmSnackBarRequest._(
            message: message, buttonText: buttonText, onPressed: onPressed);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
