import 'package:adopt_my_pet_dz/core/shared/app_bar.dart';
import 'package:adopt_my_pet_dz/core/shared/sizes.dart';
import 'package:adopt_my_pet_dz/core/widgets/error.dart';
import 'package:adopt_my_pet_dz/core/widgets/loading.dart';
import 'package:adopt_my_pet_dz/features/Authentication/presentation/blocs/loggingin_bloc/loggingin_bloc.dart';
import 'package:adopt_my_pet_dz/features/Authentication/presentation/widgets/login_form.dart';
import 'package:adopt_my_pet_dz/features/Main/presentation/pages/home_page.dart';
import 'package:adopt_my_pet_dz/injections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(globalSizeClass.heightTopNavBar),
            child: MainAppBar().call(context)),
        body: ListView(children: [
          BlocProvider(
            create: (_) => sl<LogginginBloc>(),
            child: Column(
              children: <Widget>[
                // ignore: missing_return
                BlocBuilder<LogginginBloc, LogginginState>(
                    builder: (context, state) {
                  print("state-2 $state");
                  if (state is Empty) {
                    return LoginForm();
                  } else if (state is Loading) {
                    return LoadingWidget();
                  } else if (state is Loaded) {
                    Future.delayed(Duration(milliseconds: 10), () {
                      return Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    });

                    return Container();
                  } else if (state is LoggingError) {
                    return LoginForm(email: state.email, error: state.message);
                  } else if (state is Error) {
                    return ErrorPage(message: state.message);
                  }
                }),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
