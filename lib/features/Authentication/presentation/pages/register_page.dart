import 'package:adopt_my_pet_dz/core/shared/app_bar.dart';
import 'package:adopt_my_pet_dz/core/shared/sizes.dart';
import 'package:adopt_my_pet_dz/core/widgets/error.dart';
import 'package:adopt_my_pet_dz/core/widgets/loading.dart';
import 'package:adopt_my_pet_dz/features/Authentication/presentation/blocs/register_bloc/register_bloc.dart';
import 'package:adopt_my_pet_dz/features/Authentication/presentation/widgets/register_form.dart';
import 'package:adopt_my_pet_dz/features/Main/presentation/pages/home_page.dart';
import 'package:adopt_my_pet_dz/injections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    globalSizeClass.recalcuate(MediaQuery.of(context));
    return MaterialApp(
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(globalSizeClass.heightTopNavBar),
          child: MainAppBar().call(context),
        ),
        body: buildBody(),
      ),
    );
  }

  Widget buildBody() {
    return ListView(
      shrinkWrap: true,
      children: [
        BlocProvider(
          create: (_) => sl<RegisterBloc>(),
          child: Container(
            child: Column(children: <Widget>[
              BlocBuilder<RegisterBloc, RegisterState>(
                  builder: (context, state) {
                if (state is Empty) {
                  return RegisterForm();
                } else if (state is Loading) {
                  return LoadingWidget();
                } else if (state is Loaded) {
                  Future.delayed(Duration(milliseconds: 10), () {
                    return Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ));
                  });

                  return Container();
                } else if (state is RegisterError) {
                  return RegisterForm(
                      email: state.email,
                      displayName: state.displayName,
                      error: state.message);
                } else if (state is Error) {
                  return ErrorPage(message: state.message);
                }
                return RegisterForm();
              }),
            ]),
          ),
        ),
      ],
    );
  }
}
