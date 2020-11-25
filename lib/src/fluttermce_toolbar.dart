import 'package:flutter/material.dart';
import 'package:flutter_mce/src/fluttermce_field.dart';

class FlutterMCEToolbar extends StatelessWidget {
  final FlutterMCEInputType inputType;
  final ValueChanged<FlutterMCEInputType> onInputTypeChange;
  final Color color;
  final Color colorSelected;

  FlutterMCEToolbar({
    Key key,
    this.inputType = FlutterMCEInputType.normal,
    this.onInputTypeChange,
    this.color = const Color(0xFFFFFFFF),
    this.colorSelected = const Color(0xFFCF2DF4),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(56.0),
      child: Material(
        elevation: 4.0,
        color: color,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.title),
              color: inputType == FlutterMCEInputType.header1
                  ? colorSelected
                  : Colors.black,
              onPressed: () => onInputTypeChange(FlutterMCEInputType.header1),
            ),
            IconButton(
              icon: Icon(Icons.text_fields),
              color: inputType == FlutterMCEInputType.header2
                  ? colorSelected
                  : Colors.black,
              onPressed: () => onInputTypeChange(FlutterMCEInputType.header2),
            ),
          ],
        ),
      ),
    );
  }
}
