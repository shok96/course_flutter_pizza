import 'package:flutter/material.dart';


class HeaderText extends StatelessWidget {

  String text;
  Widget child;

  HeaderText({Key? key, required this.text, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 19),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 12, bottom: 5),
            child: Text(text, style: Theme.of(context).textTheme.bodyText2?.copyWith(fontWeight: FontWeight.w400, fontSize: 18, color: Colors.black)),
          ),
          child
        ],
      ),
    );
  }
}
