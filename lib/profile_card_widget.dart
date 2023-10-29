import 'package:flutter/material.dart';

class ProfileCardWidget extends StatelessWidget {
  final String text;

  ProfileCardWidget(this.text);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Container(
        padding: EdgeInsets.all(16),
        child: Text(text),
      ),
    );
  }
}
