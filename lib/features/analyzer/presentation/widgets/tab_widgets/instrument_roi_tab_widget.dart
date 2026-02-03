import 'package:flutter/material.dart';


class InstrumentRoiTabWidget extends StatelessWidget {
  const InstrumentRoiTabWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Parent1 - Sub3 Item 1"),
        Text("Parent1 - Sub3 Item 2"),
        Text("Parent1 - Sub3 Item 3"),
      ],
    );
  }
}