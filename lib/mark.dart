import 'package:flutter/material.dart';

class Mark extends StatelessWidget {
  final IconData mark;
  final Color iconColor;
  Mark({@required this.mark, @required this.iconColor});
  @override
  Widget build(BuildContext context) {
    return Icon(
      mark,
      color: iconColor,
    );
  }
}
