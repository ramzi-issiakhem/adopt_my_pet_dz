import 'package:adopt_my_pet_dz/features/Authentication/presentation/blocs/loggingin_bloc/loggingin_bloc.dart';
import 'package:adopt_my_pet_dz/features/Authentication/presentation/blocs/register_bloc/register_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class RegisterForm extends StatelessWidget {
  final _formkey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  String displayName = "";
  String error = "";

  RegisterForm({this.email, this.error, this.displayName});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Column(
        children: [
          Text("Username : "),
          SizedBox(
            height: 5,
          ),
          TextFormField(
            initialValue: displayName == null ? "" : email,
            onChanged: (value) => displayName = value,
            validator: (value) {
              if (value.isEmpty) {
                return "An email must be provided";
              } else {
                return null;
              }
            },
          ),
          SizedBox(
            height: 12.5,
          ),
          Text("Email : "),
          SizedBox(
            height: 5,
          ),
          TextFormField(
            initialValue: email == null ? "" : email,
            onChanged: (value) => email = value,
            validator: (value) {
              if (value.isEmpty) {
                return "An email must be provided";
              } else {
                return null;
              }
            },
          ),
          SizedBox(
            height: 12.5,
          ),
          Text("Password : "),
          SizedBox(
            height: 5,
          ),
          TextFormField(
            onChanged: (value) => password = value,
            obscureText: true,
            validator: (value) {
              if (value.isEmpty || value.length < 8) {
                return "An email must be provided";
              } else {
                return null;
              }
            },
          ),
          RaisedButton(
            child: Text('Login !'),
            onPressed: () async {
              if (_formkey.currentState.validate()) {
                BlocProvider.of<RegisterBloc>(context).add(RegisterEvent(
                    email: email,
                    password: password,
                    displayName: displayName));
              }
            },
          ),
          SizedBox(
            height: 5.0,
          ),
          error == null ? Container() : Text(error),
        ],
      ),
    );
  }
}
