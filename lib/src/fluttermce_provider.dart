import 'package:flutter/material.dart';
import 'package:flutter_mce/src/utils/fluttermce_input_type.dart';

class FlutterMCEProvider extends ChangeNotifier {
  FlutterMCEInputType inputType;

  List<FocusNode> _nodes = [];
  int get focus => _nodes.indexWhere((node) => node.hasFocus);
  FocusNode nodeAt(int index) => _nodes.elementAt(index);

  List<TextEditingController> _controllers = [];
  int get length => _controllers.length;
  TextEditingController cntrAt(int index) => _controllers.elementAt(index);

  List<FlutterMCEInputType> _types = [];
  FlutterMCEInputType typeAt(int index) => _types.elementAt(index);

  FlutterMCEProvider({
    FlutterMCEInputType defaultType = FlutterMCEInputType.normal,
  }) {
    inputType = defaultType;
    insert(index: 0);
  }

  void setType(FlutterMCEInputType type) {
    if (inputType == type) {
      inputType = FlutterMCEInputType.normal;
    } else {
      inputType = type;
    }
    _types.removeAt(focus);
    _types.insert(focus, inputType);
    notifyListeners();
  }

  void setFocus(FlutterMCEInputType type) {
    inputType = type;
    notifyListeners();
  }

  void insert({
    int index,
    String text,
    FlutterMCEInputType type = FlutterMCEInputType.normal,
  }) {
    final TextEditingController controller = TextEditingController(
      text: '\u200B' + (text ?? ''),
    );
    controller.addListener(() {
      if (!controller.text.startsWith('\u200B')) {
        final int index = _controllers.indexOf(controller);
        if (index > 0) {
          cntrAt(index - 1).text += controller.text;
          cntrAt(index - 1).selection = TextSelection.fromPosition(
            TextPosition(
              offset: cntrAt(index - 1).text.length - controller.text.length,
            ),
          );
          nodeAt(index - 1).requestFocus();
          _controllers.removeAt(index);
          _nodes.removeAt(index);
          _types.removeAt(index);
          notifyListeners();
        }
      }
      if (controller.text.contains('\n')) {
        final int index = _controllers.indexOf(controller);
        List<String> _split = controller.text.split('\n');
        controller.text = _split.first;
        insert(
          index: index + 1,
          text: _split.last,
          type: typeAt(index) == FlutterMCEInputType.list
              ? FlutterMCEInputType.list
              : FlutterMCEInputType.normal,
        );
        cntrAt(index + 1).selection = TextSelection.fromPosition(
          TextPosition(offset: 1),
        );
        nodeAt(index + 1).requestFocus();
        notifyListeners();
      }
    });
    _controllers.insert(index, controller);
    _types.insert(index, type);
    _nodes.insert(index, FocusNode());
  }
}
