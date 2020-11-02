import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  final String message;

  const ErrorPage({Key key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AssetImage errorImage = AssetImage('assets/error/error_image.png');
    precacheImage(errorImage, context);

    return Center(
      child: Column(
        children: <Widget>[
          Image(image: AssetImage("assets/error/error_image.png")),
          SizedBox(
            height: 15,
          ),
          Text(message)
        ],
      ),
    );
  }
}
