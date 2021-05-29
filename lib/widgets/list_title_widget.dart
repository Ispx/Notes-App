import 'package:flutter/material.dart';

class ListTitleWidget extends StatelessWidget {
  final Widget trailing;
  final String title;
  final VoidCallback onTap;
  ListTitleWidget(
      {required this.title, required this.onTap, required this.trailing});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.fromBorderSide(
          BorderSide(
            width: 3,
            color: Colors.brown.shade900,
            style: BorderStyle.solid,
          ),
        ),
      ),
      child: ListTile(
        trailing: trailing,
        title: Text(
          title,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(
            width: 3,
            color: Colors.brown.shade900,
            style: BorderStyle.solid,
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}
