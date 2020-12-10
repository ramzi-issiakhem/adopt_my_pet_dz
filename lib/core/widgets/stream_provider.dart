import 'package:adopt_my_pet_dz/core/shared/shared.dart';
import 'package:adopt_my_pet_dz/core/streams/UserAuth.dart';
import 'package:adopt_my_pet_dz/features/Authentication/domain/entities/UserObject.dart';
import 'package:adopt_my_pet_dz/features/Authentication/presentation/pages/initialisation_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class OnUserChangesStreamProvider extends StatelessWidget {
  Widget isUserConnectedWidget;
  OnUserChangesStreamProvider({this.isUserConnectedWidget});

  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserObject>(
      create: (_) => UserAuth().controller.stream,
      initialData: currentUser,
      child: BuildChild(
        isUserConnectedWidget: isUserConnectedWidget,
      ),
    );
  }
}

// ignore: must_be_immutable
class BuildChild extends StatelessWidget {
  Widget isUserConnectedWidget;
  BuildChild({this.isUserConnectedWidget});
  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserObject>(context);
    if (user == null) {
      return InitialisationPage();
    } else {
      currentUser = user;
      return isUserConnectedWidget;
    }
  }
}
