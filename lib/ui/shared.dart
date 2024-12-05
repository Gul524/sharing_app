import 'package:flutter/material.dart';

class SharedDataView extends StatelessWidget {
  final String? sharedData;

  const SharedDataView({Key? key, this.sharedData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Shared Data View")),
      body: Center(
        child: Text(
          sharedData ?? "No shared data received.",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
