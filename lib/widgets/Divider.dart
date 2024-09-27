import 'package:flutter/material.dart';

class Divisor extends StatelessWidget {
  const Divisor({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 22),
      child: Divider(
        color: Color(0xFF272727),
        thickness: 0.3,
      ),
    );
  }
}