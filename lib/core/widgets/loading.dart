import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(children: [
      SpinKitFadingCube(
        color: Colors.blue[200],
        size: 50.0,
      ),
      SizedBox(
        height: 20,
      ),
      Text('Loading ...')
    ]));
  }
}
