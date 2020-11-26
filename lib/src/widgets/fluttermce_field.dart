import 'package:flutter/material.dart';
import 'package:flutter_mce/src/utils/colors.dart';
import 'package:flutter_mce/src/utils/fluttermce_input_type.dart';

class FlutterMCEField extends StatelessWidget {
  final FlutterMCEInputType inputType;
  final TextEditingController controller;
  final FocusNode focusNode;

  const FlutterMCEField({
    Key key,
    @required this.inputType,
    this.controller,
    this.focusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      focusNode: focusNode,
      autofocus: true,
      keyboardType: TextInputType.multiline,
      maxLines: null,
      cursorColor: COLOR_TEXT_SECONDARY,
      textAlign: TextAlign.start,
      decoration: InputDecoration(
        border: InputBorder.none,
        prefixText: inputType.prefix,
        prefixStyle: inputType.textStyle,
        isDense: true,
        contentPadding: inputType.padding,
      ),
      style: inputType.textStyle,
    );
  }
}
