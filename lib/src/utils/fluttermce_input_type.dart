enum FlutterMCEInputType {
  header1,
  normal,
  italic,
  bold,
  underline,
  list,
  quote
}

extension FlutterMCEInputTypeStyle on FlutterMCEInputType {
  TextStyle get textStyle {
    switch (this) {
      case FlutterMCEInputType.header1:
        return TextStyle(
          color: COLOR_TEXT_PRIMARY,
          fontSize: 28.0,
          fontWeight: FontWeight.w700,
        );
      case FlutterMCEInputType.normal:
        return TextStyle(
          color: COLOR_TEXT_PRIMARY,
          fontSize: 18.0,
        );
      case FlutterMCEInputType.italic:
        return TextStyle(
          color: COLOR_TEXT_PRIMARY,
          fontStyle: FontStyle.italic,
          fontSize: 18.0,
        );
      case FlutterMCEInputType.bold:
        return TextStyle(
          color: COLOR_TEXT_PRIMARY,
          fontWeight: FontWeight.w700,
          fontSize: 18.0,
        );
      case FlutterMCEInputType.underline:
        return TextStyle(
          color: COLOR_TEXT_PRIMARY,
          decoration: TextDecoration.underline,
          fontSize: 18.0,
        );
      case FlutterMCEInputType.list:
        return TextStyle(
          color: COLOR_TEXT_PRIMARY,
          fontSize: 18.0,
        );
      case FlutterMCEInputType.quote:
        return TextStyle(
          color: COLOR_TEXT_SECONDARY,
          decoration: TextDecoration.underline,
          fontSize: 18.0,
        );
      default:
        return TextStyle();
    }
  }

  EdgeInsets get padding {
    switch (this) {
      case FlutterMCEInputType.header1:
        return EdgeInsets.only(
          top: 24.0,
          right: 16.0,
          bottom: 8.0,
          left: 16.0,
        );
      case FlutterMCEInputType.list:
        return EdgeInsets.only(
          top: 4.0,
          right: 16.0,
          bottom: 4.0,
          left: 24.0,
        );
      case FlutterMCEInputType.quote:
        return EdgeInsets.only(
          top: 16.0,
          right: 16.0,
          bottom: 16.0,
          left: 24.0,
        );
      default:
        return EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 4.0,
        );
    }
  }

  String get prefix {
    switch (this) {
      case FlutterMCEInputType.list:
        return '\u2022 ';
        break;
      default:
        return '';
    }
  }
}
