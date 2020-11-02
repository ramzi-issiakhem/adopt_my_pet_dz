import 'package:adopt_my_pet_dz/core/widgets/error.dart';
import 'package:adopt_my_pet_dz/core/widgets/loading.dart';
import 'package:adopt_my_pet_dz/features/Authentication/presentation/blocs/loggingin_bloc/loggingin_bloc.dart';
import 'package:adopt_my_pet_dz/features/Authentication/presentation/pages/register_page.dart';
import 'package:adopt_my_pet_dz/features/Authentication/presentation/widgets/login_form.dart';
import 'package:adopt_my_pet_dz/features/Main/presentation/pages/home_page.dart';
import 'package:adopt_my_pet_dz/injections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => sl<LogginginBloc>(),
        child: Container(
          child: Column(children: <Widget>[
            Text("Login to Your Account"),
            SizedBox(
              height: 20,
            ),
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
            SizedBox(height: 20),
            Row(
              children: [
                Text("New User , Just Register Now =) "),
                InkWell(
                  child: Text(
                    "Click here",
                    style: TextStyle(color: Colors.blueAccent),
                  ),
                  onTap: () {
                    return Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterPage()));
                    //return RegisterPage();
                  },
                )
              ],
            )
          ]),
        ));
  }
}
