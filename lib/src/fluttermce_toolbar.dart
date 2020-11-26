import 'package:flutter/material.dart';
import 'package:flutter_mce/src/fluttermce_field.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FlutterMCEToolbar extends StatefulWidget {
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
  _FlutterMCEToolbarState createState() => _FlutterMCEToolbarState();
}

class _FlutterMCEToolbarState extends State<FlutterMCEToolbar> {
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(56.0),
      child: Material(
        elevation: 4.0,
        color: widget.color,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: FaIcon(
                FontAwesomeIcons.heading,
                size: 20.0,
              ),
              color: widget.inputType == FlutterMCEInputType.header1
                  ? widget.colorSelected
                  : Colors.black,
              onPressed: () {
                widget.onInputTypeChange(FlutterMCEInputType.header1);
              },
            ),
            IconButton(
              icon: FaIcon(
                FontAwesomeIcons.bold,
                size: 20.0,
              ),
              color: widget.inputType == FlutterMCEInputType.bold
                  ? widget.colorSelected
                  : Colors.black,
              onPressed: () {
                widget.onInputTypeChange(FlutterMCEInputType.bold);
              },
            ),
            IconButton(
              icon: FaIcon(
                FontAwesomeIcons.italic,
                size: 20.0,
              ),
              color: widget.inputType == FlutterMCEInputType.italic
                  ? widget.colorSelected
                  : Colors.black,
              onPressed: () {
                widget.onInputTypeChange(FlutterMCEInputType.italic);
              },
            ),
            IconButton(
              icon: FaIcon(
                FontAwesomeIcons.underline,
                size: 20.0,
              ),
              color: widget.inputType == FlutterMCEInputType.underline
                  ? widget.colorSelected
                  : Colors.black,
              onPressed: () {
                widget.onInputTypeChange(FlutterMCEInputType.underline);
              },
            ),
            IconButton(
              icon: FaIcon(
                FontAwesomeIcons.quoteLeft,
                size: 20.0,
              ),
              color: widget.inputType == FlutterMCEInputType.quote
                  ? widget.colorSelected
                  : Colors.black,
              onPressed: () {
                widget.onInputTypeChange(FlutterMCEInputType.quote);
              },
            ),
            IconButton(
              icon: FaIcon(
                FontAwesomeIcons.list,
                size: 20.0,
              ),
              color: widget.inputType == FlutterMCEInputType.list
                  ? widget.colorSelected
                  : Colors.black,
              onPressed: () {
                widget.onInputTypeChange(FlutterMCEInputType.list);
              },
            ),
          ],
        ),
      ),
    );
  }
}
