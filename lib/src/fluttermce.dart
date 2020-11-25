import 'package:flutter/material.dart';
import 'package:flutter_mce/src/fluttermce_field.dart';
import 'package:flutter_mce/src/fluttermce_provider.dart';
import 'package:flutter_mce/src/fluttermce_toolbar.dart';
import 'package:provider/provider.dart';

class FlutterMCE extends StatefulWidget {
  final TextEditingController controller;

  const FlutterMCE({
    Key key,
    this.controller,
  }) : super(key: key);

  @override
  _FlutterMCEState createState() => _FlutterMCEState();
}

class _FlutterMCEState extends State<FlutterMCE> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<FlutterMCEProvider>(
      create: (_) => FlutterMCEProvider(),
      builder: (BuildContext cntx, Widget child) {
        return Stack(
          children: [
            Positioned(
              top: 16,
              left: 0,
              right: 0,
              bottom: 56,
              child: Consumer<FlutterMCEProvider>(
                builder: (_, FlutterMCEProvider value, __) {
                  return ListView.builder(
                    itemCount: value.length,
                    itemBuilder: (_, int index) {
                      return Focus(
                        onFocusChange: (bool hasFocus) {
                          if (hasFocus) {
                            value.setFocus(value.typeAt(index));
                          }
                        },
                        child: FlutterMCEField(
                          inputType: value.typeAt(index),
                          controller: value.cntrAt(index),
                          focusNode: value.nodeAt(index),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Selector<FlutterMCEProvider, FlutterMCEInputType>(
                selector: (_, FlutterMCEProvider value) => value.inputType,
                builder: (BuildContext c, FlutterMCEInputType value, _) {
                  return FlutterMCEToolbar(
                    inputType: value,
                    onInputTypeChange: Provider.of<FlutterMCEProvider>(
                      c,
                      listen: false,
                    ).setType,
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
