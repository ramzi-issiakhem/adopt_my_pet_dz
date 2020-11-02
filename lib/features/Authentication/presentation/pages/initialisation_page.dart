import 'package:adopt_my_pet_dz/core/widgets/error.dart';
import 'package:adopt_my_pet_dz/core/widgets/loading.dart';
import 'package:adopt_my_pet_dz/features/Authentication/presentation/blocs/isloggedin_bloc/isloggedin_bloc.dart';
import 'package:adopt_my_pet_dz/features/Authentication/presentation/pages/login_page.dart';
import 'package:adopt_my_pet_dz/features/Main/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:adopt_my_pet_dz/injections.dart';

class InitialisationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: buildBody(context),
            appBar: AppBar(
              title: Text("Adopt My Pet"),
              actions: <Widget>[],
            )));
  }
}

BlocProvider<IsloggedinBloc> buildBody(BuildContext context) {
  return BlocProvider(
    create: (_) => sl<IsloggedinBloc>(),
    child: Center(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          BlocBuilder<IsloggedinBloc, IsloggedinState>(
            builder: (context, state) {
              print(state);
              if (state is Empty) {
                BlocProvider.of<IsloggedinBloc>(context).add(IsLoggedInEvent());
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
                  return LoginPage();
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
  );
}
