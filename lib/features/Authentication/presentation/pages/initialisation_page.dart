import 'package:adopt_my_pet_dz/core/shared/app_bar.dart';
import 'package:adopt_my_pet_dz/core/shared/sizes.dart';
import 'package:adopt_my_pet_dz/core/widgets/error.dart';
import 'package:adopt_my_pet_dz/core/widgets/loading.dart';
import 'package:adopt_my_pet_dz/features/Authentication/presentation/blocs/isloggedin_bloc/isloggedin_bloc.dart';
import 'package:adopt_my_pet_dz/features/Authentication/presentation/pages/login_page.dart';
import 'package:adopt_my_pet_dz/features/Main/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocBuilder, BlocProvider;
import 'package:adopt_my_pet_dz/injections.dart';

class InitialisationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: BuildBody(),
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(globalSizeClass.heightTopNavBar),
              child: MainAppBar().call(context),
            )));
  }
}

// PreferredSizeWidget _appBar() {
//   return PreferredSize(
//     preferredSize: Size.fromHeight(globalSizeClass.heightTopNavBar),
//     child: MainAppBar().call(context),
//   );
// }

class BuildBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    globalSizeClass.recalcuate(MediaQuery.of(context));

    return ListView(shrinkWrap: true, children: <Widget>[
      BlocProvider(
        create: (_) => sl<IsloggedinBloc>(),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            BlocBuilder<IsloggedinBloc, IsloggedinState>(
              builder: (context, state) {
                print(state);
                if (state is Empty) {
                  BlocProvider.of<IsloggedinBloc>(context)
                      .add(IsLoggedInEvent());
                  return Container(child: Text('empty'));
                } else if (state is Loading) {
                  return LoadingWidget();
                } else if (state is Loaded) {
                  bool isLoggedIn = state.state;
                  if (isLoggedIn) {
                    Future.delayed(Duration(milliseconds: 10), () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          ));
                    });
                    return Container();
                  } else if (!isLoggedIn) {
                    Future.delayed(Duration(milliseconds: 10), () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ));
                    });
                    return Container();
                  }
                } else if (state is Error) {
                  return ErrorPage(
                    message: state.message,
                  );
                }
                return Container();
              },
            )
          ],
        ),
      ),
    ]);
  }
}
