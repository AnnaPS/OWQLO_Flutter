import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String title;
  final double textSize;
  final Color textColor;
  final Color buttonColor;
  final VoidCallback onClick;

  const ButtonWidget({
    Key key,
    @required this.title,
    @required this.textSize,
    this.textColor,
    this.buttonColor,
    @required this.onClick,
  })  : assert(title != null),
        assert(textSize != null),
        assert(onClick != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onClick,
      color: buttonColor ?? Colors.grey[300],
      child: Text(
        title,
        style: TextStyle(
          fontSize: textSize,
          color: textColor ?? Colors.black,
        ),
      ),
    );
  }
}
