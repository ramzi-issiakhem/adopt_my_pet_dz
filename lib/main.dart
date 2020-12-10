import 'package:adopt_my_pet_dz/core/shared/sizes.dart';
import 'package:adopt_my_pet_dz/core/widgets/error.dart';
import 'package:adopt_my_pet_dz/core/widgets/loading.dart';
import 'package:adopt_my_pet_dz/features/Authentication/presentation/pages/initialisation_page.dart';
import 'package:adopt_my_pet_dz/injections.dart' as serviceLocator;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'cached_images.dart' as cachedImages;

void main() async {
  runApp(App());
}

class App extends StatefulWidget {
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  // Set default `_initialized` and `_error` state to false
  bool _initialized = false;
  bool _error = false;
  bool isLaunched = false;
  // Define an async function to initialize FlutterFire
  void initializeFlutterFire() async {
    try {
      // Wait for Firebase to initialize and set `_initialized` state to true
      await Firebase.initializeApp();
      await serviceLocator.init();

      setState(() {
        _initialized = true;
      });
    } catch (e) {
      // Set `_error` state to true if Firebase initialization fails
      setState(() {
        _error = true;
      });
    }
  }

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    cachedImages.init(context);

    // Show error message if initialization failed
    if (_error) {
      return ErrorPage(
        message: "FireBaseApp error",
      );
    }

    // Show a loader until FlutterFire is initialized
    if (!_initialized) {
      return MaterialApp(home: Scaffold(body: LoadingWidget()));
    }

    return InitialisationPage();
  }
}
