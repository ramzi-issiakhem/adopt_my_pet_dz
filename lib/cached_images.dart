import 'package:flutter/cupertino.dart';

void init(BuildContext context) async {
  await precacheImage(AssetImage("assets/error/error_image.png"), context);
}
