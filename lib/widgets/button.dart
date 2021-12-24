

import 'package:flutter/material.dart';
import 'package:pizza/utils/app_utils.dart';


class Button extends StatelessWidget {

  Function()? action;

  String text;

  bool enabled;

  String enabledText;

  bool error;

  Button({Key? key, this.text = "", this.action, this.enabled = true, this.enabledText = "", this.error = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: enabled ? action : () => showInSnackBar(context, enabledText),
      child: UnconstrainedBox(
        child: Container(
          decoration: BoxDecoration(
            color: enabled ? Color(0xFF0079D0) : Colors.grey,
            borderRadius: BorderRadius.circular(22),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 54),
            child: Center(child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(text, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),),
                error ? Icon(Icons.error) : Container()
              ],
            )),
          ),
        ),
      ),
    );
  }
}
