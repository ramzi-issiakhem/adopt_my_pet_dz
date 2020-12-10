import 'package:adopt_my_pet_dz/core/shared/colors.dart';
import 'package:adopt_my_pet_dz/core/shared/sizes.dart';
import 'package:adopt_my_pet_dz/features/Authentication/presentation/blocs/loggingin_bloc/loggingin_bloc.dart';
import 'package:adopt_my_pet_dz/features/Authentication/presentation/pages/register_page.dart';
import 'package:adopt_my_pet_dz/features/Authentication/presentation/widgets/container_input.dart';
import 'package:adopt_my_pet_dz/features/Main/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class LoginForm extends StatelessWidget {
  String email = "";
  String password = "";
  String error = "";
  var _keyForm = GlobalKey<FormState>();

  LoginForm({this.email, this.error});

  @override
  Widget build(BuildContext context) {
    print(globalSizeClass.containerHeight);
    print(globalSizeClass.containerWidth);
    return Column(
      children: <Widget>[
        SizedBox(
          height: 18,
        ),
        Text(
          "Adopt My Pet",
          style: TextStyle(
              color: Colors.black, fontFamily: "Impact", fontSize: 31),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            "assets/app/logo.png",
            height: 180,
            width: 180,
          ),
        ),
        SizedBox(
          height: globalSizeClass.containerHeight,
        ),
        Text(
          "Sign In to your existing Account ",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontFamily: "Trebuchet",
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Form(
          key: _keyForm,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              containerInput(
                  icon: Icons.email,
                  textfield: TextFormField(
                    autofocus: true,
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(
                      color: writeColor,
                      fontFamily: "Trebuchet",
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      hintText: "Email",
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      // enabledBorder: InputBorder.none,
                      // errorBorder: InputBorder.none,
                      errorStyle: TextStyle(color: Colors.blue),
                      // disabledBorder: InputBorder.none,
                    ),
                    initialValue: email == null ? "" : email,
                    onChanged: (value) => email = value,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "An email must be provided";
                      } else {
                        return null;
                      }
                    },
                  )),
              SizedBox(
                height: 20.5,
              ),
              containerInput(
                  icon: Icons.lock,
                  textfield: TextFormField(
                    keyboardType: TextInputType.text,
                    style: TextStyle(
                      color: writeColor,
                      fontFamily: "Trebuchet",
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      hintText: "Password",
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),
                    onChanged: (value) => password = value,
                    obscureText: true,
                    validator: (value) {
                      if (value.isEmpty || value.length < 8) {
                        return "Type a correct password";
                      } else {
                        return null;
                      }
                    },
                  )),
              SizedBox(
                height: 15.0,
              ),
              error == null
                  ? Container()
                  : Text(
                      error,
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: "Trebuchet",
                          color: Colors.red),
                    ),
              SizedBox(
                height: 10,
              ),
              ButtonTheme(
                buttonColor: mainColor,
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: mainColor, width: 1.0),
                  borderRadius: BorderRadius.circular(14.0),
                ),
                minWidth: globalSizeClass.containerWidth,
                height: globalSizeClass.containerHeight,
                child: RaisedButton(
                  child: Text(
                    'Sign In',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Trebuchet",
                    ),
                  ),
                  onPressed: () async {
                    if (_keyForm.currentState.validate()) {
                      BlocProvider.of<LogginginBloc>(context)
                          .add(LoggingInEvent(email, password));
                    }
                  },
                ),
              ),
              SizedBox(
                height: 3,
              ),
              InkWell(
                child: Text(
                  "Forgot Username / Password ? ",
                  style: TextStyle(
                    fontFamily: "Trebuchet",
                    color: writeColor,
                  ),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
              ),
            ],
          ),
        ),
        SizedBox(
          height: 35,
        ),
        Text(
          "Don't Have an Account ? ",
          style: TextStyle(
            color: writeColor,
            fontFamily: "Trebuchet",
          ),
        ),
        SizedBox(
          height: 2,
        ),
        ButtonTheme(
          buttonColor: Color(0xFF74A2FF),
          shape: RoundedRectangleBorder(
            side: BorderSide(color: mainColor, width: 1.0),
            borderRadius: BorderRadius.circular(14.0),
          ),
          minWidth: globalSizeClass.containerWidth,
          height: globalSizeClass.containerHeight,
          child: RaisedButton(
            child: Text(
              'Register',
              style: TextStyle(
                color: Colors.white,
                fontFamily: "Trebuchet",
              ),
            ),
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => RegisterPage()));
            },
          ),
        )
      ],
    );
  }
}
