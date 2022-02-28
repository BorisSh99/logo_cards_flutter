import 'package:flutter/material.dart';

class RenameCardListWidget extends StatefulWidget {
  const RenameCardListWidget({Key? key}) : super(key: key);

  @override
  _RenameCardListWidgetState createState() => _RenameCardListWidgetState();
}

class _RenameCardListWidgetState extends State<RenameCardListWidget> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Rename card collection',
          ),
        ],
      ),
    );
  }
}
