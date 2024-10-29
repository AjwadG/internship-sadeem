import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PhoneTextField extends StatelessWidget {
  final TextEditingController? controller;
  final Function? onFieldSubmitted;
  final Function? validator;

  const PhoneTextField({
    Key? key,
    this.controller,
    this.onFieldSubmitted,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: 9,
      controller: controller,
      validator: validator as String? Function(String?)?,
      textInputAction: TextInputAction.next,
      inputFormatters: [
        LengthLimitingTextInputFormatter(9),
        FilteringTextInputFormatter.digitsOnly
      ],
      onFieldSubmitted: onFieldSubmitted as void Function(String)?,
      keyboardType: TextInputType.phone,
      textAlignVertical: TextAlignVertical.center,
      textAlign: TextAlign.left,
      maxLines: 1,
      style: TextStyle(fontSize: 24, color: Colors.grey[900]),
      decoration: InputDecoration(
        hintText: '9xxxxxxxx',
        suffixIcon: Container(
            width: 75,
            padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
            alignment: Alignment.centerLeft,
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: Text(
                '+218 -',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22, color: Colors.grey[900]),
              ),
            )),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
          borderRadius: BorderRadius.all(Radius.circular(9)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(9)),
          borderSide: BorderSide(width: 1, color: Colors.grey),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(9)),
          borderSide: BorderSide(width: 1, color: Colors.grey),
        ),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(9)),
            borderSide: BorderSide(width: 1, color: Colors.red)),
      ),
    );
  }
}
