import 'dart:async';

import 'package:adopt_my_pet_dz/core/network/network_info.dart';
import 'package:adopt_my_pet_dz/core/shared/app_bar.dart';
import 'package:adopt_my_pet_dz/core/shared/routes.dart';
import 'package:adopt_my_pet_dz/core/shared/shared.dart';
import 'package:adopt_my_pet_dz/core/shared/sizes.dart';
import 'package:adopt_my_pet_dz/core/widgets/bottomNavBar.dart';
import 'package:adopt_my_pet_dz/core/widgets/error.dart';
import 'package:adopt_my_pet_dz/core/widgets/stream_provider.dart';
import 'package:adopt_my_pet_dz/features/Authentication/data/models/UserObjectModel.dart';
import 'package:adopt_my_pet_dz/features/Authentication/domain/entities/UserObject.dart';
import 'package:adopt_my_pet_dz/features/Lost/presentation/pages/lost_page.dart';
import 'package:adopt_my_pet_dz/features/Lost/presentation/pages/main_lost_page.dart';
import 'package:adopt_my_pet_dz/injections.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    globalSizeClass.recalcuate(MediaQuery.of(context));

    return MaterialApp(
      routes: routes().call(context),
      home: DefaultTabController(
        initialIndex: 1,
        length: 5,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(globalSizeClass.heightTopNavBar),
            child: MainAppBar().call(context),
          ),
          body: BuildBody(),
          bottomNavigationBar: bottomNavBar(context),
        ),
      ),
    );
  }
}

class BuildBody extends StatelessWidget {
  const BuildBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: <Widget>[
        Container(
          color: Colors.red,
        ),
        MainLostPage(),
        Container(
          color: Colors.purple,
        ),
        Container(
          color: Colors.green,
        ),
        Container(
          color: Colors.pink,
        ),
      ],
    );
  }
}
