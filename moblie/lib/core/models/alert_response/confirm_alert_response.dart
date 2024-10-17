import 'package:built_value/built_value.dart';

part 'confirm_alert_response.g.dart';

abstract class ConfirmAlertResponse
    implements Built<ConfirmAlertResponse, ConfirmAlertResponseBuilder> {
  bool get confirmed;

  ConfirmAlertResponse._();

  factory ConfirmAlertResponse(
          [void Function(ConfirmAlertResponseBuilder)? updates]) =
      _$ConfirmAlertResponse;
}
